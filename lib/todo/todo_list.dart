import 'package:demo/bloc/todo_bloc.dart';
import 'package:demo/event/delete_todo_event.dart';
import 'package:demo/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodoBloc>(
        builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
            stream: bloc.todoListStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].content),
                          trailing: GestureDetector(
                            onTap: () {
                              bloc.event
                                  .add(DeleteTodoEvent(snapshot.data![index]));
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red[400],
                            ),
                          ),
                        );
                      });
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      child: Text(
                        'empty',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                case ConnectionState.none:
                default:
                  return Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(),
                    ),
                  );
              }
            }),
      ),
    );
  }
}
