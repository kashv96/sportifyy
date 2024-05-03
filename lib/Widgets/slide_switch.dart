import 'package:flutter/material.dart';

class SlideSwitch extends StatefulWidget {
  final String leftOption;
  final String rightOption;
  final double height;
  final double width;
  final Function(bool) onChanged;
  final Color primaryColor; // Default primary color
  final Color secondaryColor; // Default secondary color

  const SlideSwitch({
    Key? key,
    required this.leftOption,
    required this.rightOption,
    this.height = 50,
    this.width = 300,
    required this.onChanged,
    this.primaryColor = Colors.black, // Defaults to black
    this.secondaryColor = Colors.white, // Defaults to white
  }) : super(key: key);

  @override
  _SlideSwitchState createState() => _SlideSwitchState();
}

class _SlideSwitchState extends State<SlideSwitch> {
  bool _isLeftSelected = true;

  void _toggleSwitch() {
    setState(() {
      _isLeftSelected = !_isLeftSelected;
    });
    widget.onChanged(_isLeftSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.primaryColor, // Uses primary color
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Static text labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(widget.leftOption,
                      style: TextStyle(
                          color: widget.secondaryColor, // Uses secondary color
                          fontSize: 14)),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(widget.rightOption,
                      style: TextStyle(
                          color: widget.secondaryColor, // Uses secondary color
                          fontSize: 14)),
                ),
              ],
            ),
            // Animated container for the selected option
            AnimatedAlign(
              alignment: _isLeftSelected
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                height: widget.height,
                width: widget.width / 2 +
                    10, // Adjust the width to overlap the text
                decoration: BoxDecoration(
                  color: widget.secondaryColor, // Uses secondary color
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: widget.primaryColor,
                      width: 0.5), // Optional border
                ),
                alignment: Alignment.center,
                child: Text(
                  _isLeftSelected ? widget.leftOption : widget.rightOption,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        widget.primaryColor, // Text color matches primary color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
