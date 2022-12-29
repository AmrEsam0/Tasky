import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todos = [];

  final _myBox = Hive.box('myBox');

  void createInitialTodos() {
    todos = [
      {
        'title': 'Buy milk',
        'isDone': false,
      },
      {
        'title': 'Buy eggs',
        'isDone': true,
      },
      {
        'title': 'Buy bread',
        'isDone': false,
      },
    ];
  }

  void loadData() {
    todos = _myBox.get('TODOS');
  }

  void updateData() {
    _myBox.put('TODOS', todos);
  }
}
