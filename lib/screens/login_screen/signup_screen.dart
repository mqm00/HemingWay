import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:hemingway/screens/login_screen/login_screen.dart';
import 'package:hemingway/main.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:hemingway/api/add_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

enum Gender { MAN, WOMEN }

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _specificAddressController =
  TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
  TextEditingController();

  Gender _gender = Gender.MAN;

  String _imageFile = 'assets/images/main.png';

  File? userPickedImage;

  Widget _nameWidget() {
    return TextFormField(
      controller: _nameController,
      decoration:
      const InputDecoration(border: OutlineInputBorder(), labelText: '이름'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '이름을 입력해주세요.';
        }
        return null;
      },
    );
  }

  Widget _genderWidget() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RadioListTile(
              title: Text('남자'),
              value: Gender.MAN,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  if (value != null) _gender = value as Gender;
                });
              },
            ),
            RadioListTile(
              title: Text('여자'),
              value: Gender.WOMEN,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  if (value != null) _gender = value as Gender;
                });
              },
            )
          ],
        ));
  }

  Widget _birthDateWidget() {
    // 일단 텍스트 입력으로 만들어 놨는데 나중에 spinner ui 사용하는게 더 이쁠 것 같음.
    return TextFormField(
      controller: _birthDateController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: '생년월일 YYYYMMDD'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '생년월일을 입력해주세요.';
        } // 예외처리가 필요하긴 할 듯?
      },
    );
  }

  Widget _phoneNumberWidget() {
    // 예외처리나 ui 손을 봐야함. 인증은 다음에 하는 걸로...
    return TextFormField(
      controller: _phoneNumberController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: '전화번호 01012345678'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '전화번호를 입력해주세요.';
        }
        return null;
      },
    );
  }

  Widget _addressWidget() {
    return TextFormField(
      // enabled: false,
      controller: _addressController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: '도로명 주소'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '주소를 입력해주세요.';
        }
        return null;
      },
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _addressAPI();
      },
    );
  }

  Widget _specifiedAddressWidget() {
    return TextFormField(
      controller: _specificAddressController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: "상세 주소"),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '상세주소를 입력해주세요.';
        }
      },
    );
  }

  Widget _userIdWidget() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration:
      const InputDecoration(border: OutlineInputBorder(), labelText: '이메일'),
      validator: (String? value) {
        if (value!.isEmpty) {
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
      validator: (String? value) {
        if (value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        return null;
      },
    );
  }

  Widget _passwordAgainWidget() {
    return TextFormField(
      controller: _passwordConfirmController,
      obscureText: true,
      // keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: '비밀번호 확인',
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        } else if (value != _passwordController.text) {
          return '비밀번호가 다릅니다.';
        }
        return null;
      },
    );
  }

  Widget _signupButtonWidget() {
    return Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 8.0),
        child: ElevatedButton(
            onPressed: () => _signup(), child: const Text("회원 가입")));
  }

  Widget _photoButtonWidget() {
    return Container(
        height: 70,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 8.0),
        child: ElevatedButton(
            onPressed: () {
              showAlert(context);
            },
            child: const Text("사진 등록")));
  }

  void pickedImage(File image) {
    userPickedImage = image;
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: AddImage(pickedImage),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("회원가입"),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: [
                      Image(
                          width: 70.0,
                          height: 30.0,
                          image: AssetImage('image/sailboat.png')),
                      const SizedBox(height: 20.0),
                      _nameWidget(),
                      const SizedBox(height: 20.0),
                      _genderWidget(),
                      const SizedBox(height: 20.0),
                      _birthDateWidget(),
                      const SizedBox(height: 20.0),
                      _phoneNumberWidget(),
                      const SizedBox(height: 20.0),
                      _addressWidget(),
                      const SizedBox(height: 20.0),
                      _specifiedAddressWidget(),
                      const SizedBox(height: 20.0),
                      _userIdWidget(),
                      const SizedBox(height: 20.0),
                      _passwordWidget(),
                      const SizedBox(height: 20.0),
                      _passwordAgainWidget(),
                      const SizedBox(height: 20.0),
                      _photoButtonWidget(),
                      const SizedBox(height: 20.0),
                      _signupButtonWidget()
                    ],
                  ),
                ),
              ))),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => RemediKopo(),
        ));
    _addressController.text =
    '${model.zonecode!} ${model.address!} ${model.buildingName!}';
  }

  _signup() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());

      try {
        final User? user = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text))
            .user;
        //이승수
        //ref는 하나의 storage 폴더에 접근
        final refImage = FirebaseStorage.instance.ref()
            .child('picked_image')
            .child(user!.uid + '.png');
        await refImage.putFile(userPickedImage!);
        final url = await refImage.getDownloadURL();

        if (userPickedImage == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('please pick your image'),
            backgroundColor: Colors.blue,));
          return;
        }
        //이승수

        CollectionReference userCollection =
        FirebaseFirestore.instance.collection('user');

        userCollection.doc(user!.uid).set({
          'name': _nameController.text,
          'gender': describeEnum(_gender),
          'birth_date': _birthDateController.text,
          'phone_number': _phoneNumberController.text,
          'address':
          _addressController.text + " " + _specificAddressController.text,
          'profileUrl': "",
          'picked_image' : url,
        }).then((value) async {
          await FirebaseAuth.instance.signOut();
          Get.offAll(() => const LoginScreen());
        }).catchError((e) async {
          logger.e(e);

          await FirebaseAuth.instance.currentUser!.delete();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e),
              backgroundColor: Colors.deepOrange,
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        logger.e(e);
        String message = '';

          if (e.code == 'weak-password') {
            message = '비밀번호는 6자리 이상으로 설정해주세요.';
          } else if (e.code == 'email-already-in-use') {
            message = '이미 사용 중인 이메일입니다.';
          }

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            backgroundColor: Colors.deepOrange,
          ));
      }
    }
  }
}
