import 'package:demo/bloc/todo_bloc.dart';
import 'package:demo/event/add_todo_event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var txtTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: txtTodoController,
            decoration:
                InputDecoration(labelText: 'Add todo', hintText: 'Add todo'),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            bloc.event.add(AddTodoEvent(txtTodoController.text));
          },
          child: Row(
            children: [Icon(Icons.add), Text('Add')],
          ),
        )
      ],
    );
  }
}
