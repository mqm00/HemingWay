import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignupScreen = true;
  final _authentication = FirebaseAuth.instance; //이메일이나 패스워드를 사용해 로그인 할 수 있는 메서드 사용 가능


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('image/white.jpg'),
                      fit: BoxFit.fill
                  ),
                ),
                child: RichText(
                        text: TextSpan(
                          text: 'Welcome to',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                            text: ' HemingWay',
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)
                            ),
                          ]
                        ),
                      ),
                  ),
                ),
          ],
        )
    );
  }
}