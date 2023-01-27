import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hemingway/screens/login_screen/login_screen.dart';
import 'package:logger/logger.dart';
import 'screens/main_screen/main_screen.dart';
import 'package:hemingway/screens/expert_screen/expert_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hemingway/screens/expert_screen/test.dart';
import 'package:provider/provider.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HemingWay',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: LoginScreen(),
    );
  }
}