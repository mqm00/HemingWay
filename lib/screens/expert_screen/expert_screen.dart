import 'package:flutter/material.dart';
import 'request_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hemingway/api/seller_info.dart';

class ExpertInformation extends StatefulWidget {
  const ExpertInformation({Key? key}) : super(key: key);


  @override
  State<ExpertInformation> createState() => _ExpertInformationState();
}

class _ExpertInformationState extends State<ExpertInformation> {

  CollectionReference product = FirebaseFirestore.instance.collection('BxPkxOdKcKTyN7SRCysB');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('전문가 정보',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
          stream: product.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index){
                  final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                  print(documentSnapshot['name']);
                  return Card(
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      subtitle: Text(documentSnapshot['age']),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
    );
  }
}
