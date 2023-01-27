import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hemingway/main.dart';
import 'package:hemingway/screens/expert_screen/expert_screen.dart';
import 'package:hemingway/screens/login_screen/signup_screen.dart';
import 'package:hemingway/screens/main_screen/main_screen.dart';
import 'package:hemingway/screens/expert_screen/test.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController(); // 입력되는 값을 제어
  final TextEditingController _passwordController = TextEditingController();

  String _imageFile = 'image/sailboat.png'; // 로그인 폼 상단에 이미지 표시. 이미지 없으면 엑박으로 뜸
  Widget _userIdWidget() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '이메일'
      ),
      validator: (String? value) {
        if(value!.isEmpty) { // null or isEmpty
          return '이메일을 입력해주세요.';
        }
        return null;
      },
    );
  }

  Widget _passwordWidget() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      // keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '비밀번호',
      ),
      validator: (String? value) { // null or isEmpty
        if(value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        return null;
      },
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
              Image(width: 200.0, height: 200.0, image: AssetImage('image/sailboat.png')),
              const SizedBox(height: 20.0),
              _userIdWidget(),
              const SizedBox(height: 20.0),
              _passwordWidget(),
              Container(
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 8.0), // 8단위 배수가 보기 좋음
                child: ElevatedButton(
                  onPressed: () => _login(),
                  child: const Text("로그인")
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 8.0), // 8단위 배수가 보기 좋음
                child: ElevatedButton(
                    onPressed: () => Get.to(SignupScreen()),
                    child: const Text("회원가입")
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  @override
  void initState() { // 해당 클래스가 호출 되었을 때
    super.initState();
  }

  @override
  void dispose() { // 해당 클래스가 사라졌을 때
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _login() async {
    // 키보드 숨기기
    if(_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());

      // firebase 사용자 인증 & 사용자 등록
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
        String userId = await FirebaseAuth.instance.currentUser!.uid;
        Get.offAll(() => MyApp2());
      } on FirebaseException catch(e) {
        logger.e(e);
        String message = '';

        if(e.code == 'user-not-found') {
          message = '사용자가 존재하지 않습니다.';
        } else if(e.code == 'wrong-password') {
          message = '비밀번호를 확인하세요.';
        } else if(e.code == 'invalid-email') {
          message = '이메일을 확인하세요.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.deepOrange,
          )
        );
      }
    }
  }
}
