import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../info_screen/info.dart';

class LoadingScreen extends StatelessWidget {

  LoadingScreen({Key? key, required this.coding_checked, required this.sido, required this.gugun, required this.field}) : super(key: key);
  List<String> coding_checked;
  String sido;
  String gugun;
  String field;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          body: Loading_screen(coding_checked: coding_checked, sido: sido, gugun: gugun, field : field)
    );
  }
}

class Loading_screen extends StatefulWidget{

  Loading_screen({Key? key, required this.coding_checked, required this.sido, required this.gugun, required this.field}) : super(key: key);

  List<String> coding_checked;
  String sido;
  String gugun;
  String field;


  @override
  State<StatefulWidget> createState() => _loading_screen();
}

class _loading_screen extends State<Loading_screen>{




  @override
  Widget build(BuildContext context) {


    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),
        body:
         StreamBuilder(
          stream: FirebaseFirestore.instance.collection('field_price').where('field', isEqualTo: widget.field).snapshots(),
           builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(
                 child: CircularProgressIndicator(),
               );
             }

             final docs = snapshot.data!.docs;
             return Column(
               children: docs.map((DocumentSnapshot documentSnapshot) {
                 Map<String, dynamic> data =
                 documentSnapshot.data()! as Map<String, dynamic>;

                 return Center(
                     child:
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                             padding: EdgeInsets.only(top: height * 0.15),
                             child: SpinKitChasingDots(
                               color: Colors.black45,
                               size: height * 0.2,
                             )),
                         Container(
                             margin: EdgeInsets.only(
                                 top: height * 0.1, bottom: height * 0.1),
                             child:
                             Text(
                               '이 분야의 평균 가격은 ${data['price'].toString()}원 입니다.',
                               style: TextStyle(fontSize: height * 0.025),)
                         ),
                         Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Container(
                               width: width * 0.6,
                               height: height * 0.06,
                               child: ElevatedButton(
                                 child: Text('다음',
                                     style: TextStyle(color: Colors.black)),
                                 style: ButtonStyle(
                                     backgroundColor: MaterialStateProperty.all(
                                         Colors.grey[300])
                                 ),
                                 onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(
                                       builder: (context) =>
                                           informationSeller(coding_checked : widget.coding_checked, sido:
                                               widget.sido, gugun : widget.gugun, field: widget.field)));
                                 },
                               ),
                             )
                             ]
                         ),
                       ],
                     ));
               }
               ).toList().cast(),

               // Text(data['price'].toString(), style: TextStyle(color: Colors.black,fontSize: 20),);
             );
           }
         )
    );

  }
}

//TODO db에서 평균 가격 알아오기
//TODO 다음 버튼으로 전문가 리스트 (유민언니 화면) 넘어가기

