import 'package:flutter/material.dart';
import 'package:sportifyy/Widgets/custom_text_field.dart';
import '../../Widgets/custom_dropdown.dart';
import '../../Widgets/custom_navigation_bar.dart';

class AddGameEventPage extends StatefulWidget {
  @override
  _AddGameEventPageState createState() => _AddGameEventPageState();
}

class _AddGameEventPageState extends State<AddGameEventPage> {
  String? _selectedDate = 'Option 1';
  String? _gameLocation = 'City 1, Country';
  int _selectedIndex = 2;

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
                  child: Text('Game Title',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (val) => {},
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  label: 'Game Location',
                  selectedValue: _gameLocation,
                  items: const [
                    'City 1, Country',
                    'City 2, Country',
                    'City 3, Country'
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      _gameLocation = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  label: 'Event Date',
                  selectedValue: _selectedDate,
                  items: const ['Option 1', 'Option 2', 'Option 3'],
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  label: 'Game Type',
                  selectedValue: _selectedDate,
                  items: const ['Option 1', 'Option 2', 'Option 3'],
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  label: 'Maximum Players',
                  selectedValue: _selectedDate,
                  items: const ['Option 1', 'Option 2', 'Option 3'],
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomDropdown(
                  label: 'Event Duration',
                  selectedValue: _selectedDate,
                  items: const [
                    'Option 1',
                    'Option 2',
                    'Option 3'
                  ], // Placeholder for date options
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
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
                              text: '(per player)',
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
                  onChanged: (val) => {},
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {},
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
}
