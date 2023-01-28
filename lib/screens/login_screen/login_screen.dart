import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hemingway/main.dart';
import 'package:hemingway/screens/login_screen/additional_info_screen.dart';
import 'package:hemingway/screens/login_screen/email_login_screen.dart';
import 'package:hemingway/screens/main_screen/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key : key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              foregroundColor: Colors.white,
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
                    "Google로 시작하기",
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
    return SizedBox(
      height: 70,
      width: double.infinity,
      // padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffFEE500),
              foregroundColor: Color(0xffFEE500),
          ),
          onPressed: () => _kakaoLogin(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/logo/login/kakao_logo.png'),
                  height: 48.0,
                  width: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 8),
                  child: Text(
                    "카카오로 시작하기",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff191919),
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

  Widget _naverWidget() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      // padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff03C75A),
              foregroundColor: Color(0xff03C75A)
          ),
          onPressed: () => _naverLogin(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/logo/login/naver_green_circle_logo.png'),
                  height: 48.0,
                  width: 48,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 8),
                  child: Text(
                    "네이버로 시작하기",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
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

  Widget _emailWidget() {
    return SizedBox(
      height: 70,
      width: double.infinity,
      // padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
          onPressed: () => _emailLogin(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 8),
                  child: Text(
                    "이메일로 시작하기",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
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
      User user = await FirebaseAuth.instance.currentUser!;
      String userId = user.uid;

      CollectionReference userCollection = FirebaseFirestore.instance.collection('user');

      print(userId);

      userCollection.get().then((value) => {
        value.docs.forEach((element) {
          if(element.id == userId) {
            print("Exists");
            Get.offAll(() => MyApp2());
          }
        })});

      Get.offAll(AdditionalInfoScreen());

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
    Get.offAll(() => EmailLoginScreen());
  }
}