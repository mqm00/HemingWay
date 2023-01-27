
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hemingway/api/seller_info.dart';
import 'package:hemingway/screens/expert_screen/test.dart';
/*import 'expert_provider.dart';
import 'package:provider/provider.dart';

class Expert{
  late String id;
  late List<String> tech; //언어
  late String name;
  late String age;
  late String sex;
  late String education; //학력
  late String field; //전문분야
  late String rating; //별점대신
  late String career; //경력
  Image image = AssetImage('assets/img.png') as Image; // 기본 이미지 넣어두기

  Expert({
    //required는 생성자가 기본값이 없고, null이 아닌 경우에 사용
    required this.id,
    required this.tech,
    required this.name,
    required this.age,
    required this.sex,
    required this.education,
    required this.field,
    required this.rating,
    required this.career,
 });

  Expert.fromSnapshot(DocumentSnapshot documentSnapshot){
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    id = documentSnapshot.id;
    tech = data['tech'];
    name = data['name'];
    age = data['age'];
    sex = data['sex'];
    education = data['education'];
    field = data['field'];
    rating = data['rating'];
    career = data['career'];
  }
}*/



class informationSeller extends StatefulWidget {
  informationSeller({Key? key, required this.coding_checked, required this.sido, required this.gugun, required this.field}) : super(key: key);
  List<String> coding_checked;
  String sido;
  String gugun;
  String field;

  @override
  State<informationSeller> createState() => _informationSellerState();
}

class _informationSellerState extends State<informationSeller> {

  //late String id;
  late List<String> tech; //언어
  late String name;
  late String age;
  late String sex;
  late String education; //학력
  late String field; //전문분야
  late String rating; //별점대신
  late String career; //경력
  //Image image = AssetImage('assets/img.png') as Image; // 기본 이미지 넣어두기

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('seller_user');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '검증된 전문가를 만나보세요.',
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(color: Colors.black,),
        backgroundColor: Colors.grey,
        elevation: 0.0,
      ),
      body:
      StreamBuilder(
        stream: collectionReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot){

          if(streamSnapshot.hasData){
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index){
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                print(documentSnapshot['name']);
                return CupertinoButton(
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder:(context) => Test(documentSnapshot.id)),);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            image:
                            DecorationImage(
                                image: AssetImage('assets/person1.png')
                            ),
                          ),

                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(documentSnapshot['name'],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),),
                              Text('(만' + documentSnapshot['age'].toString() + '세)',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),)
                            ]
                        ),
                        Text('● ' + documentSnapshot['education'],
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    )
                );
                /*Card( //(TODO)여기서 바둑알 모양으로 나오게 바꿔줘야 해
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['age'].toString()),
                  ),
                );*/
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),


    );
  }

  Widget buttonSection = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.tune,
          size: 15,
          color: Colors.grey,
        ),
        OutlinedButton(
          onPressed: (){ //눌렀을 때
            print('textButton Pressed');
          },
          child: Text('가격 낮은 순',
            style: TextStyle(
                fontSize: 10.0,
                color: Colors.black
            ),
          ),
        ),
        OutlinedButton(
          onPressed: (){ //눌렀을 때
            print('textButton Pressed');
          },
          child: Text('가격 높은 순',
            style: TextStyle(
                fontSize: 10.0,
                color: Colors.black
            ),
          ),
        ),
        OutlinedButton(
          onPressed: (){ //눌렀을 때
            print('textButton Pressed');
          },
          child: Text('최근 거래 순',
            style: TextStyle(
                fontSize: 10.0,
                color: Colors.black
            ),
          ),
        ),
        OutlinedButton(
          onPressed: (){ //눌렀을 때
            print('textButton Pressed');
          },
          child: Text('리뷰 많은 순',
            style: TextStyle(
                fontSize: 10.0,
                color: Colors.black
            ),
          ),
        ),
      ],
    ),
  );


  Widget SellerIcon = Container(
    child:
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              //borderRadius: BorderRadius.all(Radius.circular(10)),
                onPressed: () {},
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image:
                        DecorationImage(
                            image: AssetImage('assets/person1.png')
                        ),
                      ),

                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('박건률',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                          const Text('(만 22세/남)',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),)
                        ]
                    ),
                    const Text('● 서강대학교 화학공학과 졸업',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Text('5.0',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text('(3)   ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          const Text('2회 고용',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                backgroundColor: Colors.grey
                            ),
                          ),
                        ]
                    ),
                    const Text('경력 7년',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),

                  ],
                )
            ),
            CupertinoButton(
              //borderRadius: BorderRadius.all(Radius.circular(10)),
                onPressed: () {},
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image:
                        DecorationImage(
                            image: AssetImage('assets/person2.png')
                        ),
                      ),

                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('이유민',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                          const Text('(만 21세/여)',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),)
                        ]
                    ),
                    const Text('● 한양대학교 컴퓨터공학과 졸업',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Text('4.3',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text('(3)   ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          const Text('1회 고용',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                backgroundColor: Colors.grey
                            ),
                          ),
                        ]
                    ),
                    const Text('경력 4년',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              //borderRadius: BorderRadius.all(Radius.circular(10)),
                onPressed: () {},
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image:
                        DecorationImage(
                            image: AssetImage('assets/person3.png')
                        ),
                      ),

                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('이승수',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                          const Text('(만 22세/남)',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),)
                        ]
                    ),
                    const Text('● 서강대학교 화학공학과 졸업',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Text('5.0',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text('(3)   ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          const Text('2회 고용',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                backgroundColor: Colors.grey
                            ),
                          ),
                        ]
                    ),
                    const Text('경력 7년',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),

                  ],
                )
            ),
            CupertinoButton(
              //borderRadius: BorderRadius.all(Radius.circular(10)),
                onPressed: () {},
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image:
                        DecorationImage(
                            image: AssetImage('assets/person4.png')
                        ),
                      ),

                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('황진하',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                          const Text('(만 23세/남)',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),)
                        ]
                    ),
                    const Text('● 서울대학교 기계공학과 졸업',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Text('4.9',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text('(9)   ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          const Text('11회 고용',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                backgroundColor: Colors.grey
                            ),
                          ),
                        ]
                    ),
                    const Text('경력 3년',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),

                  ],
                )
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              //borderRadius: BorderRadius.all(Radius.circular(10)),
                onPressed: () {},
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image:
                        DecorationImage(
                            image: AssetImage('assets/person5.png')
                        ),
                      ),

                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('탁민주',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                          const Text('(만 20세/여)',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),)
                        ]
                    ),
                    const Text('● 이화여자대학교 과학교육과 재학',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Text('3.8',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text('(4)   ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          const Text('5회 고용',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                backgroundColor: Colors.grey
                            ),
                          ),
                        ]
                    ),
                    const Text('경력 5년',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),

                  ],
                )
            ),
            CupertinoButton(
              //borderRadius: BorderRadius.all(Radius.circular(10)),
                onPressed: () {},
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image:
                        DecorationImage(
                            image: AssetImage('assets/person6.png')
                        ),
                      ),

                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('유석원',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),),
                          const Text('(만 24세/남)',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),)
                        ]
                    ),
                    const Text('● 성균관대학교 전자공학과 재학',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellow,
                          ),
                          const Text('3.7',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text('(2)   ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          const Text('4회 고용',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                backgroundColor: Colors.grey
                            ),
                          ),
                        ]
                    ),
                    const Text('경력 1년',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey
                      ),
                    ),

                  ],
                )
            ),
          ],
        ),
      ],
    ),

  );
}
