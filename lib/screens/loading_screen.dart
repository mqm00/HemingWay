import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    return CupertinoPageScaffold(
        child:
            Stack(
                children:
                [
                Align(
                  alignment: Alignment.topLeft,
                  child:
                  Padding(padding: EdgeInsets.fromLTRB(10,40.0, 0,0),
                    child:
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_sharp),color: Colors.black,),
                  )),

                  Align(
                    alignment: Alignment.center,
                    child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [
                            SpinKitChasingDots(
                          color: Colors.black45,
                              size: 100,
                        ),
                            Padding(padding: EdgeInsets.all(30)),
                            Text('이 분야의 시간당 평균 가격은 얼마입니다.', )
                          ],
                        )

                    ),
]
    )

    );

  }
}

//TODO db에서 평균 가격 알아오기

