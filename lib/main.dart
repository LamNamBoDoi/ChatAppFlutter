import 'package:demo/search_bloc.dart';
import 'package:demo/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Provider<SearchBloc>.value(
        value: SearchBloc(),
        child: SearchView(),
      )),
    );
  }
}
