/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'info.dart';

class expertProvider with ChangeNotifier{ //이 클래스의 객체를 통해 data를 제공받음
  late CollectionReference expertReference;
  List<Expert> experts = [];

  expertProvider({reference}){
    expertReference = reference ?? FirebaseFirestore.instance.collection('seller_user');
  }

  Future<void> fetchExpert() async{
    experts = await expertReference.get().then( (QuerySnapshot result) {
      return result.docs.map( (DocumentSnapshot document) {
        return Expert.fromSnapshot(document);
      }).toList();
    });
    notifyListeners(); //완료되었다.
  }
}*/
