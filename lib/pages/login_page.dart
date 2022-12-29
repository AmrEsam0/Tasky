// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/colors/colors.dart';
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
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: SvgPicture.asset(
                      'lib/assets/logo.svg',
                      color: mainColor2,
                    ),
                  ),
                  const SizedBox(height: 80),
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
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor2,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 86,
                        vertical: 12,
                      ),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14,
                        color: textMain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          fontSize: 14,
                          color: textMain,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            color: mainColor2,
                          ),
                        ),
                      ),
                    ],
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
