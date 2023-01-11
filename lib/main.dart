import 'package:flutter/material.dart';
import 'screens/expert_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HemingWay',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: ExpertInformation(),
    );
  }
}