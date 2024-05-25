import 'package:flutter/material.dart';
import 'package:sportifyy/Widgets/custom_text_field.dart';
import 'package:sportifyy/Widgets/custom_dropdown.dart';
import 'package:sportifyy/Providers/game_provider.dart';
import 'package:sportifyy/injection.dart';

class GameLocationInputBottomSheet extends StatefulWidget {
  @override
  _GameLocationInputBottomSheetState createState() =>
      _GameLocationInputBottomSheetState();
}

class _GameLocationInputBottomSheetState
    extends State<GameLocationInputBottomSheet> {
  final GameProvider _gameProvider = getIt();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: Colors.white),
        height: screenHeight * 0.82,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Container(
              //   height: screenHeight * 0.06,
              //   decoration: const BoxDecoration(
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(25),
              //         topRight: Radius.circular(25),
              //       ),
              //       color: Colors.black),
              //   width: double.infinity,
              //   child: const Padding(
              //     padding: EdgeInsets.only(top: 8.0),
              //     child: Text(
              //       'Location Details',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontSize: 22,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white, // Text color for the header
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      child: Text('Apt/House Number',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      initialValue: _gameProvider.apt,
                      onChanged: (value) {
                        _gameProvider.setApt(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      child: Text('Street Address',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                    ),
                    CustomTextField(
                      initialValue: _gameProvider.streetAddress,
                      onChanged: (value) {
                        _gameProvider.setStreetAddress(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      child: Text('City',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                    ),
                    CustomTextField(
                      initialValue: _gameProvider.city,
                      onChanged: (value) {
                        _gameProvider.setCity(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      label: 'Country',
                      selectedValue: _gameProvider.country,
                      items: _gameProvider.countries,
                      onChanged: (newValue) {
                        setState(() {
                          _gameProvider.setProv(null);
                        });
                        _gameProvider.setCountry(newValue);
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      label: 'State/Province',
                      selectedValue: _gameProvider.state,
                      items: _gameProvider.country == 'Canada'
                          ? _gameProvider.canStates
                          : _gameProvider.usStates,
                      onChanged: (newValue) {
                        _gameProvider.setProv(newValue);
                      },
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                      child: Text('Zipcode',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      initialValue: _gameProvider.zipcode,
                      onChanged: (value) {
                        _gameProvider.setZipcode(value);
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black, // Text color
                          minimumSize: Size(double.infinity, 50) // Button size
                          ),
                      onPressed: () {
                        _gameProvider.setAddress();
                        Navigator.pop(context);
                      },
                      child: Text('Save', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
