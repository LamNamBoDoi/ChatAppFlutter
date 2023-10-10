import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/signin.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/servise/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Thông qua dòng này chúng ta có được tất cả được khởi tạo
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: FutureBuilder(
        future: AuthMethods().getcurrentUser(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return SignIn();
          }
        },
      ),
    );
  }
}
