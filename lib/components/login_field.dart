// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../assets/colors/colors.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.prefixIcon,
    this.suffixIcon,
    this.controller,
  });

  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        color: textMain,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: dimLights),
        suffixIcon: obscureText ? Icon(suffixIcon, color: dimLights) : null,
        fillColor: backgroundLight2,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: textMain,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: dimLights,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor2,
          ),
        ),
      ),
    );
  }
}
