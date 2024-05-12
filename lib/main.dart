import 'package:demo/bloc/todo_bloc.dart';
import 'package:demo/db/TodoDatabase.dart';
import 'package:demo/todo/todo_list_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Todo List'),
          ),
          body: Provider<TodoBloc>.value(
            value: TodoBloc(),
            child: TodoListContainer(),
          ),
        ));
  }
}
