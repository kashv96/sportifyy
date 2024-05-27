import 'package:flutter/material.dart';
import 'package:sportifyy/Presentation/GameEvent/open_game_bottomsheets.dart';
import 'package:sportifyy/Providers/game_provider.dart';
import 'package:sportifyy/Widgets/custom_text_field.dart';
import 'package:sportifyy/Widgets/loading_diaglog.dart';
import '../../Widgets/custom_dropdown.dart';
import '../../Widgets/custom_navigation_bar.dart';
import '../../Widgets/toast_helper.dart';
import '../../injection.dart';
import '../HomePage/home_page_screen.dart';

class AddGameEventPage extends StatefulWidget {
  @override
  _AddGameEventPageState createState() => _AddGameEventPageState();
}

class _AddGameEventPageState extends State<AddGameEventPage> {
  int _selectedIndex = 2;
  final GameProvider _gameProvider = getIt();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Create Game Event',
              style: TextStyle(color: Colors.black, fontSize: 22)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text('Event Details',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  child: Text('Game Location',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _openGameLocationModal(),
                  child: Column(
                    children: [
                      IgnorePointer(
                        ignoring: true,
                        child: CustomTextField(
                          readOnly: true,
                          initialValue: _gameProvider.address,
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  child: Text('Event Date/Time',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _openGameDateTimeModal(),
                  child: Column(
                    children: [
                      IgnorePointer(
                        ignoring: true,
                        child: CustomTextField(
                          readOnly: true,
                          initialValue: _gameProvider.gameDateTime,
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  label: 'Game Type',
                  selectedValue: _gameProvider.selectedGame,
                  items: _gameProvider.outdoorGames,
                  onChanged: (value) {
                    _gameProvider.setSelectedGame(value);
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  label: 'Maximum Spots',
                  selectedValue: _gameProvider.selectedGameSpots,
                  items: _gameProvider.maxSpots,
                  onChanged: (value) {
                    _gameProvider.setMaxSpots(value);
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  child: Text('Event Duration',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _openGameDurationModal(),
                  child: Column(
                    children: [
                      IgnorePointer(
                        ignoring: true,
                        child: CustomTextField(
                          readOnly: true,
                          initialValue: _gameProvider.gameDuration,
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          text: 'Entry Price ',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                          children: <TextSpan>[
                            TextSpan(
                              text: '(per spot)',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200),
                            )
                          ])),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  onChanged: (val) => {_gameProvider.setEntryPricePerSpot(val)},
                  initialValue: _gameProvider.entryPricePerSpot,
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    _handleRegisterGameEvent(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Create',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }

  void _openGameLocationModal() {
    OpenGameBottomsheets.showGameLocationInputModal(context, onClosed: () {
      setState(() {});
    });
  }

  void _openGameDateTimeModal() {
    OpenGameBottomsheets.showGameEventDateModal(context, onClosed: () {
      setState(() {});
    });
  }

  void _openGameDurationModal() {
    OpenGameBottomsheets.showGameEventDurationModal(context, onClosed: () {
      setState(() {});
    });
  }

  void _handleRegisterGameEvent(BuildContext context) async {
    LoadingDialog.show(context, message: "Creating game event...");
    bool created = await _gameProvider.registerGameEvent();
    await Future.delayed(const Duration(seconds: 2));
    LoadingDialog.hide(context);
    if (created) {
      ToastHelper.show('Event registeration successful!',
          textColor: Colors.green);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePageScreen()),
      );
    } else {
      ToastHelper.show(
          'Something went wrong while registration, Please try again!',
          textColor: Colors.red);
    }
  }
}
