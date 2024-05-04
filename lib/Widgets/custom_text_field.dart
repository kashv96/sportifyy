import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final Function(String) onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.label,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
