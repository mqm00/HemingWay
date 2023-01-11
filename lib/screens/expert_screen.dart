import 'package:flutter/material.dart';
import 'request_screen.dart';

class ExpertInformation extends StatefulWidget {
  const ExpertInformation({Key? key}) : super(key: key);

  @override
  State<ExpertInformation> createState() => _ExpertInformationState();
}

class _ExpertInformationState extends State<ExpertInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '전문가 정보',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: //SingleChildScrollView(
          //stack widget 바꾸기
          //child:
          Stack(
        //층층이 쌓이는 형태이므로 -> stack은 겹치는 게 필요할 때 사용하는 위젯, 잘못됐다.
        children: [
          Positioned(
            //원하는 곳에 위젯을 배치할 수 있게 해주는 위젯
            top: 50,
            right: 250,
            left: 10,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.blueGrey),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: AssetImage('image/person.png'),
                ),
              ),
            ),
          ), //사진
          Positioned(
            top: 30,
            left: 190,
            right: 0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '이름',
                      style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '홍길동',
                      style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '나이',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '만 23세',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '최근 거래가',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '프로젝트 당 2,000,000',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), //이름, 나이, 최근 거래가
          Positioned(
            top: 245,
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),
          ), //중간 선 그리기
          Positioned(
            top: 260,
            left: 30,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.43,
              //cloumn singlechildscrollview로
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.calculate),
                          ),
                          TextSpan(
                            text: ' 해당 분야 평균 가격',
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '1,500,000원',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //RichText 컨테이너에 넣어보고 싶음
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.language),
                          ),
                          TextSpan(
                            text: ' 전문 분야',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '앱 개발',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.lightbulb),
                          ),
                          TextSpan(
                            text: ' 기술 스택',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Java, Flutter, Swift',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.face),
                          ),
                          TextSpan(
                            text: ' 자기 소개',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 23,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '나는 홍길동이오',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '평점',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        text: '★★★★☆',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.school),
                          ),
                          TextSpan(
                            text: ' 한양대학교',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.schedule),
                          ),
                          TextSpan(
                            text: ' 17년',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.place),
                          ),
                          TextSpan(
                            text: '서울 성동구, 종로구',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ), //상세 정보
          Positioned(
            right: MediaQuery.of(context).size.width-411,
            top: MediaQuery.of(context).size.height*0.81,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RequestPaper()));
              },
              child: Text('의뢰하기', style: TextStyle(fontSize: 15, letterSpacing: 1.0),),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                  //borderRadius: BorderRadius.circular(.0),
                ),
                elevation: 1.0,
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
