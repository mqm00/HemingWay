import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hemingway/main.dart';
import 'package:hemingway/screens/main_screen/main_screen.dart';

class MultipleLoginScreen extends StatefulWidget {
  const MultipleLoginScreen({Key? key}) : super(key : key);

  @override
  State<MultipleLoginScreen> createState() => _MultipleLoginScreenState();
}

class _MultipleLoginScreenState extends State<MultipleLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _imageFile = 'assets/logo/main/sailboat.png';

  Widget _googleWidget() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      // padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.white
          ),
          onPressed: () => _googleLogin(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/logo/login/google_logo.png'),
                  height: 18.0,
                  width: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 8),
                  child: Text(
                    "Google로 시작",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  Widget _kakaoWidget() {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        onPressed: () => _kakaoLogin(),
        child: const Text("카카오톡으로 시작"),
      ),
    );
  }

  Widget _naverWidget() {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        onPressed: () => _naverLogin(),
        child: const Text("네이버로 시작"),
      ),
    );
  }

  Widget _emailWidget() {
    return Container(
      height: 70,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        onPressed: () => _emailLogin(),
        child: const Text("이메일로 로그인"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("로그인"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image(
                  width: 200.0,
                  height: 200.0,
                  image: AssetImage(_imageFile),
                ),
                const SizedBox(height: 20.0),
                _googleWidget(),
                const SizedBox(height: 20.0),
                _kakaoWidget(),
                const SizedBox(height: 20.0),
                _naverWidget(),
                const SizedBox(height: 20.0),
                _emailWidget()
              ],
            ),
          ),
        )
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAll(() => MyApp2());
    } on FirebaseAuthException catch(e) {
      logger.e(e);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("에러발생"),
            backgroundColor: Colors.deepOrange,
          )
      );
    }
  }

  _kakaoLogin() async {

  }

  _naverLogin() async {

  }

  _emailLogin() async {

  }
}