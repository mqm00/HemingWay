import 'package:flutter/material.dart';
import 'screens/expert_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp2());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HemingWay',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: MainWidget(),
    );
  }
}