import 'package:cloud_firestore/cloud_firestore.dart';

class SellerInformation {

  SellerInformation(String id){
    userDoc = id;
  }

  final _firestore = FirebaseFirestore.instance.collection('seller_user');
  String userDoc = '';
  String userName = '';
  String userAge = '';
  String userCareer = '';
  String userEducation = '';
  String userField = '';

  getData() async{
    final _firestore = FirebaseFirestore.instance.collection('seller_user');
    var docSnapshot = await _firestore.doc('BxPkxOdKcKTyN7SRCysB').get();
    Map<String, dynamic> information = docSnapshot.data()!;
    print(information['name']);
  }

  getName(){
    return userName;
  }

}