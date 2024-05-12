import 'package:demo/todo/todo_header.dart';
import 'package:demo/todo/todo_list.dart';
import 'package:flutter/material.dart';

class TodoListContainer extends StatelessWidget {
  const TodoListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TodoHeader(),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}
