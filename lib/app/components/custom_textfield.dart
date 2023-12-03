import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({required this.hintText, this.obscureText = false, this.prefixIcon, this.suffixIcon, required this.controller});
  String hintText;
  bool obscureText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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