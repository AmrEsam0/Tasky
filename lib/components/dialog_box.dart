import 'package:flutter/material.dart';

import '../assets/colors/colors.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback? onAdd;
  VoidCallback? onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundLight,
      title: const Text('Add new todo', style: TextStyle(color: Colors.white)),
      content: TextField(
        autofocus: true,
        style: const TextStyle(color: Colors.white),
        cursorColor: mainColor,
        controller: controller,
        decoration: InputDecoration(
          fillColor: backgroundLighter,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: backgroundLighter),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: mainColor),
          ),
          hintText: 'Enter title',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
      ),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: onAdd,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(mainColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
