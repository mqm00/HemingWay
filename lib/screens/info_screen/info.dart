import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*void main() => runApp(infoApp());

class infoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: informationSeller(),
    );
  }
}*/

/* 정보 받아둬야 할텐데...
class Expert{
  String name = '';
  Image image = AssetImage('assets/img.png') as Image; // 기본 이미지 넣어두기
  String info = '';
//나이, 성별
//별점
//고용횟수
}
void makeList(){}*/

/*
ToggleButtons*/

class informationSeller extends StatefulWidget {
  const informationSeller({Key? key}) : super(key: key);

  @override
  State<informationSeller> createState() => _informationSellerState();
}

class _informationSellerState extends State<informationSeller> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '검증된 전문가를 만나보세요.',
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton()/*IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back, color: Colors.black),
        )*/,
        backgroundColor: Colors.grey,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          buttonSection,
          //toggleBar,
          SellerIcon,
        ],
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
