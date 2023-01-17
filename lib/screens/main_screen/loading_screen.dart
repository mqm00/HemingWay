import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hemingway/screens/info_screen/info.dart';

class LoadingScreen extends StatelessWidget {

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
          body: Loading_screen()
    );
  }
}

class Loading_screen extends StatefulWidget{

  const Loading_screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _loading_screen();
}

class _loading_screen extends State<Loading_screen>{


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
        child:
            Column(
                children:
                [
                Row(
                  children:
                  [
                    Container(
                    width: width*0.2,
                    height: height*0.15,
                    child:
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_sharp),color: Colors.black,),
                  )]),

                  Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [
                            Container(
                                padding: EdgeInsets.only(top: height*0.1),
                            child: SpinKitChasingDots(
                          color: Colors.black45,
                              size: height*0.2,
                        )),
                            Container(
                              padding: EdgeInsets.only(top: height*0.1, bottom: height*0.1),
                                child: Text('이 분야의 시간당 평균 가격은 얼마입니다.',style: TextStyle(fontSize: height*0.02 ))
                            ),
                          ],  )),

                 Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Container(
                            width: width*0.6,
                            height: height*0.06,
                            child: ElevatedButton(
                              child: Text('다음', style: TextStyle(color: Colors.black)),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.grey[300])
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => informationSeller()));
                              },
                            ),
                          )]
                    ),
]
    )

    );

  }
}

//TODO db에서 평균 가격 알아오기
//TODO 다음 버튼으로 전문가 리스트 (유민언니 화면) 넘어가기

