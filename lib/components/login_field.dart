// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../assets/colors/colors.dart';

class LoginField extends StatefulWidget {
  LoginField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.prefixIcon,
    this.controller,
    required this.isPassword,
  });

  final TextEditingController? controller;
  final String hintText;
  bool obscureText;
  final IconData prefixIcon;
  bool isPassword;

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      style: const TextStyle(
        color: textMain,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon, color: dimLights),
        suffixIcon: widget.isPassword
            ? IconButton(
                splashRadius: .1,
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(
                  widget.obscureText ? Icons.visibility_off : Icons.visibility,
                  color: dimLights,
                ))
            : null,
        fillColor: backgroundLight2,
        filled: true,
        hintText: widget.hintText,
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
