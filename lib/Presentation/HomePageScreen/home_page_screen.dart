import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sportifyy/Widgets/circular_icon_tile.dart';
import 'package:sportifyy/Widgets/custom_navigation_bar.dart';

import '../../Widgets/activity_tile.dart';
import '../../Widgets/slide_switch.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> activities = [
      {
        'title': 'Join Game',
        'subtitle': 'Upcoming',
        'time': 'Today',
        'image': AssetImage('assets/images/story_image_01.png'),
        'isActive': true,
      },
      {
        'title': 'Match Day',
        'subtitle': 'Friendly Match',
        'time': '30 min.',
        'image': AssetImage('assets/images/story_image_02.png'),
        'isActive': false,
      },
      {
        'title': 'Team Captain',
        'subtitle': 'Practice',
        'time': '1 week ago',
        'image': AssetImage('assets/images/story_image_03.png'),
        'isActive': true,
      },
      {
        'title': 'Match Day',
        'subtitle': 'Friendly Match',
        'time': '30 min.',
        'image': AssetImage('assets/images/story_image_02.png'),
        'isActive': false,
      },
      {
        'title': 'Join Game',
        'subtitle': 'Upcoming',
        'time': 'Today',
        'image': AssetImage('assets/images/story_image_01.png'),
        'isActive': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
        title: const Text('Sports Events',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Enter sport or location',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  filled: false,
                  // Background color set to black
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.blueGrey, width: 2.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  CircularIconTile(
                      title: 'Create',
                      image: AssetImage('assets/images/story_image_03.png')),
                  CircularIconTile(
                      title: 'Join Now',
                      image: AssetImage('assets/images/story_image_02.png')),
                  CircularIconTile(
                      title: 'Get Started',
                      image: AssetImage('assets/images/story_image_01.png')),
                  CircularIconTile(
                      title: 'Find Players',
                      image: AssetImage('assets/images/story_image_02.png')),
                  CircularIconTile(
                      title: 'Gear Up',
                      image: AssetImage('assets/images/story_image_03.png')),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: SlideSwitch(
                leftOption: 'Invitations',
                rightOption: 'Schedule Game',
                onChanged: (bool isLeftSelected) {
                  print(
                      'Selected option: ${isLeftSelected ? 'Invitations' : 'Schedule Game'}');
                },
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: screenSize.height * 0.4,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: activities.length,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityTile(
                    title: activities[index]['title'],
                    subtitle: activities[index]['subtitle'],
                    time: activities[index]['time'],
                    image: activities[index]['image'],
                    isActive: activities[index]['isActive'],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Container(),
              ),
            ),
          ],
        ),
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
}
