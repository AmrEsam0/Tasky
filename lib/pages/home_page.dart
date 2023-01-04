import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasky/data/database_handler.dart';

import '../assets/colors/colors.dart';
import '../components/dialog_box.dart';
import '../components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get('TODOS') == null) {
      db.createInitialTodos();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkboxTapped(int index) {
    setState(() {
      db.todos[index]['isDone'] = !db.todos[index]['isDone'];
    });
    db.updateData();
  }

  final _addNewTodoController = TextEditingController();

  void addNewTodo() {
    setState(() {
      db.todos.add({
        'title': _addNewTodoController.text,
        'isDone': false,
      });
    });
    _addNewTodoController.clear();
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTodo() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _addNewTodoController,
          onAdd: addNewTodo,
          onCancel: () {
            Navigator.of(context).pop();
            _addNewTodoController.clear();
          },
        );
      },
    );
  }

  void deleteTodo(int index) {
    setState(() {
      db.todos.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 0.8 * MediaQuery.of(context).size.width,
        height: 0.14 * MediaQuery.of(context).size.width,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(0.01 * MediaQuery.of(context).size.width),
          ),
          onPressed: createNewTodo,
          backgroundColor: mainColor,
          child: const Icon(Icons.add, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: 0.2 * MediaQuery.of(context).size.width),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: db.todos.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                title: db.todos[index]['title'],
                isDone: db.todos[index]['isDone'],
                onChanged: (value) => checkboxTapped(index),
                onDismissed: (context) => deleteTodo(index),
              );
            },
          ),
        ),
      ),
    );
  }
}
