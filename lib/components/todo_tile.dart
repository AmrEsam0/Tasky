// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../assets/colors/colors.dart';

class ToDoTile extends StatelessWidget {
  final String title;
  final bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDismissed;

  ToDoTile({
    Key? key,
    required this.title,
    required this.isDone,
    required this.onChanged,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(4),
            onPressed: onDismissed,
            label: 'Delete',
            icon: Icons.delete,
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: backgroundLight,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          leading: Checkbox(
            value: isDone,
            onChanged: onChanged,
            activeColor: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            side: BorderSide(
              color: Colors.white.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: isDone ? Colors.white.withOpacity(0.5) : Colors.white,
              decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
