// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tasky/assets/colors/colors.dart';

import '../components/login_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textMain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  LoginField(
                    hintText: 'Email',
                    controller: _emailController,
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  LoginField(
                    hintText: 'Password',
                    controller: _passwordController,
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    suffixIcon: Icons.visibility,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
