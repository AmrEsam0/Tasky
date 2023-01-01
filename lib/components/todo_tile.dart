// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../assets/colors/colors.dart';
import '../data/database_handler.dart';
import 'dialog_box.dart';

class ToDoTile extends StatefulWidget {
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
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  final _editTodoController = TextEditingController();

  void Function()? onAdd;

  void Function()? onCancel;

  final _myBox = Hive.box('myBox');

  ToDoDatabase db = ToDoDatabase();

  // TODO: change this to be startaction slidable
  // edittodo function is called when the user clicks on the edit button
  DialogBox editTodo(String title, int index) {
    print("SOMETHING AINT RIGHT!!");
    _editTodoController.text = title;
    return DialogBox(
      controller: _editTodoController,
      onAdd: () {
        setState(() {
          db.todos[index]['title'] = _editTodoController.text;
        });
        Navigator.of(context).pop();
        _editTodoController.clear();
        db.updateData();
      },
      onCancel: () {
        Navigator.of(context).pop();
        _editTodoController.clear();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(4),
            onPressed: widget.onDismissed,
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
          onTap: () => editTodo(widget.title, db.todos.indexOf(widget.title)),
          dense: true,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          leading: Checkbox(
            value: widget.isDone,
            onChanged: widget.onChanged,
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
            widget.title,
            style: TextStyle(
              fontSize: 20,
              color: widget.isDone ? Colors.white.withOpacity(0.5) : Colors.white,
              decoration: widget.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
