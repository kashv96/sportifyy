import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportifyy/Models/Entities/GameEvent.dart';
import 'package:sportifyy/Providers/game_provider.dart';
import 'package:sportifyy/Widgets/circular_icon_tile.dart';
import 'package:sportifyy/Widgets/custom_navigation_bar.dart';
import 'package:lottie/lottie.dart';

import '../../Widgets/activity_tile.dart';
import '../../Widgets/slide_switch.dart';
import '../../injection.dart';
import '../GameEvent/Widgets/GameEventCard.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;
  final GameProvider _gameProvider = getIt();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(FontAwesomeIcons.solidBell, color: Colors.black),
          ),
        ],
        title: const Text('Sports Events',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 2),
          () => _gameProvider.getAllGameEvents(),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset('assets/json/ball_animation.json',
                  width: 400, height: 400),
            );
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Failed to load data!"));
          }

          var activities = _gameProvider.allGameEvents;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                _buildSearchBar(),
                const SizedBox(height: 10),
                _buildIconTiles(),
                const SizedBox(height: 20),
                _buildSwitch(),
                const SizedBox(height: 30),
                _buildGameEventList(screenSize, activities),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: 'Enter Location',
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.blueGrey, width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget _buildIconTiles() {
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CircularIconTile(
              title: 'Baseball',
              image: AssetImage('assets/images/baseball.png')),
          CircularIconTile(
              title: 'Soccer',
              image: AssetImage('assets/images/soccerball.png')),
          CircularIconTile(
              title: 'Volleyball',
              image: AssetImage('assets/images/volleyball.png')),
          CircularIconTile(
              title: 'Basketball',
              image: AssetImage('assets/images/basketball.png')),
          CircularIconTile(
              title: 'Table Tennis',
              image: AssetImage('assets/images/table_tennis.png')),
        ],
      ),
    );
  }

  Widget _buildSwitch() {
    return Center(
      child: SlideSwitch(
        leftOption: 'Schedule Game',
        rightOption: 'Invitations',
        onChanged: (bool isLeftSelected) {
          print(
              'Selected option: ${isLeftSelected ? 'Invitations' : 'Schedule Game'}');
        },
      ),
    );
  }

  Widget _buildGameEventList(Size screenSize, List<GameEvent> activities) {
    return Container(
      height: screenSize.height * 0.4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        itemCount: activities.length,
        itemBuilder: (BuildContext context, int index) {
          var event = activities[index];
          return Container(
            width: screenSize.width * 0.9,
            child: GameEventCard(
              uniqueIdentifier: event.uniqueIdentifier!,
              availableSpots: '${event.availableSpots} spots left',
              gameDateTime: event.gameDateTime!,
              gameDuration: event.gameDuration!,
              imagePath: 'assets/images/story_image_03.png',
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 10),
      ),
    );
  }
}
