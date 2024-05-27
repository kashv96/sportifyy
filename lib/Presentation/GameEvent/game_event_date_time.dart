import 'package:flutter/material.dart';
import 'package:sportifyy/Providers/game_provider.dart';
import '../../Widgets/custom_dropdown.dart';
import '../../injection.dart'; // Ensure the path is correct

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
  String? selectedZone;

  final GameProvider _gameProvider = getIt();

  @override
  void initState() {
    super.initState();
    selectedDay = _gameProvider.days[0];
    selectedMonth = _gameProvider.months[0];
    selectedYear = _gameProvider.years[0];
    selectedHour = _gameProvider.hours[0];
    selectedMinute = _gameProvider.minutes[0];
    selectedZone = _gameProvider.ampm[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdown(
                    label: "Day",
                    items: _gameProvider.days,
                    selectedValue: selectedDay,
                    onChanged: (value) {
                      setState(() {
                        selectedDay = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomDropdown(
                    label: "Month",
                    items: _gameProvider.months,
                    selectedValue: selectedMonth,
                    onChanged: (value) {
                      setState(() {
                        selectedMonth = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomDropdown(
                    label: "Year",
                    items: _gameProvider.years,
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomDropdown(
                    label: "Hour",
                    items: _gameProvider.hours,
                    selectedValue: selectedHour,
                    onChanged: (value) {
                      setState(() {
                        selectedHour = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomDropdown(
                    label: "Minute",
                    items: _gameProvider.minutes,
                    selectedValue: selectedMinute,
                    onChanged: (value) {
                      setState(() {
                        selectedMinute = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomDropdown(
                    label: "AM/PM",
                    items: _gameProvider.ampm,
                    selectedValue: selectedZone,
                    onChanged: (value) {
                      setState(() {
                        selectedZone = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30), // Space before the button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black, // Text color
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: const Size(double.infinity, 50) // Button size
                  ),
              onPressed: () {
                _gameProvider.setGameDateTime(
                    '$selectedMonth $selectedDay, $selectedYear $selectedHour:$selectedMinute $selectedZone');
                Navigator.pop(context);
              },
              child: const Text('Save Date & Time',
                  style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
