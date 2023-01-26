import 'package:cloud_firestore/cloud_firestore.dart';

class API {
  API(String id){
    userDoc = id;
  }
  final _firestore = FirebaseFirestore.instance.collection('seller_user');
  static String? userDoc;
  static String? userName;
  static String? userAge;
  static String? userCareer;
  static String? userEducation;
  static String? userField;
  var information;

  getData() async {
    information = await _firestore.doc(userDoc).get();
    //print(information.data());
  }
}