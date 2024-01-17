import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    required this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.onTap,
  });
  String hintText;
  bool obscureText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextEditingController controller;
  void Function()? onTap;

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
        suffix: suffixIcon != null
            ? GestureDetector(
                onTap: onTap,
                child: Icon(
                  suffixIcon,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
    );
  }
}
