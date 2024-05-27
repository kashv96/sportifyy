import 'package:flutter/material.dart';
import 'package:sportifyy/Providers/game_provider.dart';
import '../../Widgets/custom_dropdown.dart';
import '../../injection.dart'; // Ensure the path is correct

class GameEventDurationBottomsheet extends StatefulWidget {
  @override
  _GameEventDurationBottomsheetState createState() =>
      _GameEventDurationBottomsheetState();
}

class _GameEventDurationBottomsheetState
    extends State<GameEventDurationBottomsheet> {
  String? selectedHours;
  String? selectedMinutes;

  final GameProvider _gameProvider = getIt();

  @override
  void initState() {
    super.initState();
    selectedHours = _gameProvider.hours[0];
    selectedMinutes = _gameProvider.minutes[0];
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
                    label: "Hours",
                    items: _gameProvider.hours,
                    selectedValue: selectedHours,
                    onChanged: (value) {
                      setState(() {
                        selectedHours = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomDropdown(
                    label: "Minutes",
                    items: _gameProvider.minutes,
                    selectedValue: selectedMinutes,
                    onChanged: (value) {
                      setState(() {
                        selectedMinutes = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black, // Text color
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  minimumSize: const Size(double.infinity, 50) // Button size
                  ),
              onPressed: () {
                _gameProvider.setGameDuration(
                    '$selectedHours hr and $selectedMinutes mins');
                Navigator.pop(context);
              },
              child:
                  const Text('Save Duration', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
