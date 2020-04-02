import 'package:flutter/material.dart';
import 'package:play_layout/Screens/home.dart';
import 'package:play_layout/Screens/login.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Layout',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home': (context) => Home(),
      },
    );
  }
}
