import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'info_bubble.dart';

class ExpertApi extends StatelessWidget {
  const ExpertApi({Key? key}) : super(key: key);
  //FirebaseFirestore.instance.collection().doc().get()
  // get -> future -> awaitfmf FirebaseFirestore 앞에 붙여주고 async
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('seller_user').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final infoDocs = streamSnapshot.data!.docs;
        return ListView.builder(
          itemCount: infoDocs.length,
          itemBuilder: (context, index){
            return InfoBubble(infoDocs[index]['name']);
          },
        );
      },
    );
  }
}
