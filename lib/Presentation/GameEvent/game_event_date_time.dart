import 'package:flutter/material.dart';
import '../../Widgets/custom_dropdown.dart'; // Ensure the path is correct

class GameEventDateTimeBottomsheet extends StatefulWidget {
  @override
  _GameEventDateTimeBottomsheetState createState() =>
      _GameEventDateTimeBottomsheetState();
}

class _GameEventDateTimeBottomsheetState
    extends State<GameEventDateTimeBottomsheet> {
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedHour;
  String? selectedMinute;
  String? selectedSecond;

  final List<String> days =
      List.generate(31, (index) => (index + 1).toString());
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  final List<String> years =
      List.generate(3, (index) => (2024 + index).toString());
  final List<String> hours =
      List.generate(24, (index) => index.toString().padLeft(2, '0'));
  final List<String> minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));
  final List<String> seconds =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));

  @override
  void initState() {
    super.initState();
    // Setting initial values for dropdowns
    selectedDay = days[0];
    selectedMonth = months[0];
    selectedYear = years[0];
    selectedHour = hours[0];
    selectedMinute = minutes[0];
    selectedSecond = seconds[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdown(
                    label: "Day",
                    items: days,
                    selectedValue: selectedDay,
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10), // Add space between the dropdowns
                Expanded(
                  child: CustomDropdown(
                    label: "Month",
                    items: months,
                    selectedValue: selectedMonth,
                    onChanged: (value) {
                      setState(() {
                        selectedMonth = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10), // Add space between the dropdowns
                Expanded(
                  child: CustomDropdown(
                    label: "Year",
                    items: years,
                    selectedValue: selectedYear,
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Space between rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdown(
                    label: "Hour",
                    items: hours,
                    selectedValue: selectedHour,
                    onChanged: (value) {
                      setState(() {
                        selectedHour = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10), // Add space between the dropdowns
                Expanded(
                  child: CustomDropdown(
                    label: "Minute",
                    items: minutes,
                    selectedValue: selectedMinute,
                    onChanged: (value) {
                      setState(() {
                        selectedMinute = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10), // Add space between the dropdowns
                Expanded(
                  child: CustomDropdown(
                    label: "Second",
                    items: seconds,
                    selectedValue: selectedSecond,
                    onChanged: (value) {
                      setState(() {
                        selectedSecond = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30), // Space before the button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black, // Text color
                  padding: EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(double.infinity, 50) // Button size
                  ),
              onPressed: () {
                // Functionality to save or use the date and time
                Navigator.pop(context);
              },
              child: Text('Save Date & Time', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
