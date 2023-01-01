// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/colors/colors.dart';
import '../components/login_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 48),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: SvgPicture.asset('lib/assets/logo2.svg'),
                    ),
                    const SizedBox(height: 80),
                    LoginField(
                      isPassword: false,
                      hintText: 'Email',
                      controller: _emailController,
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    LoginField(
                      isPassword: true,
                      hintText: 'Password',
                      controller: _passwordController,
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    LoginField(
                      isPassword: true,
                      hintText: 'Confirm Password',
                      controller: _confirmPasswordController,
                      prefixIcon: Icons.lock,
                      obscureText: true,
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
                      child: Text('Register', style: TextStyle(fontSize: 18, color: Colors.black)),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 14,
                            color: textMain,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Log in',
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
      ),
    );
  }
}
