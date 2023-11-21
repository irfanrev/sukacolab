import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({required this.hintText, this.obscureText = false, this.prefixIcon, this.suffixIcon});
  String hintText;
  bool obscureText;
  IconData? prefixIcon;
  IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: obscureText ? Icon(Icons.visibility) : null,
      ),
    );
  }
}