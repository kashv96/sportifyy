import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String label;
  final Function(String?) onChanged;
  String? selectedValue;

  CustomDropdown({
    Key? key,
    required this.items,
    required this.label,
    required this.onChanged,
    this.selectedValue,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(widget.label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade400, width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: widget.selectedValue,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: Colors.black),
              iconSize: 24,
              style: TextStyle(color: Colors.black, fontSize: 16),
              dropdownColor: Colors.white,
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(value, style: TextStyle(color: Colors.black)),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  widget.selectedValue = newValue;
                });
                widget.onChanged(newValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}
