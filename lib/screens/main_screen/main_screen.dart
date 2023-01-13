import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coding_detail.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';


// void main() {
//   runApp(MyApp());
// }

// final String iosTestId = 'ca-app-pub-3940256099942544/2934735716';
//
// BannerAd? banner;

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false, //remove debug expression
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // TargetPlatform os = Theme.of(context).platform;
    //
    // BannerAd banner = BannerAd(
    //   listener: BannerAdListener(
    //     onAdFailedToLoad: (Ad ad, LoadAdError error) {},
    //     onAdLoaded: (_) {},
    //   ),
    //   size: AdSize.banner,
    //   adUnitId: iosTestId,
    //   request: AdRequest(),
    // )..load();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   backgroundColor: Colors.transparent,
      // ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(25, 60, 0, 0),
                height: height*0.2,
                child: Align(
                  alignment: Alignment.topLeft,
                    child: Text('안녕하세요\n어떤 일이 필요하신가요?',
                        style: TextStyle(/*fontFamily: 'SCDream',*/
                            fontSize: height*0.035)))),
                Container(
                  height: height*0.16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Container(
                              width: width*0.15,
                              height: height*0.08,
                              decoration: const BoxDecoration(
                                image:
                                DecorationImage(
                                    image: AssetImage('assets/school_emoji.png')
                                ),
                              ),

                            ),
                            Text('과외',
                              style: TextStyle(
                                fontSize: height * 0.02,
                                color: Colors.black,),)
                          ],
                        )
                    ),


                    CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                        onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(builder:(context) => Coding1()),);
                        },
                        child: Column(
                          children: [
                            Container(
                              width: width*0.15,
                              height: height*0.08,
                              decoration:  const BoxDecoration(
                                image:
                                DecorationImage(
                                  image: AssetImage('assets/coding_emoji.png'),
                                ),
                              ),
                            ),
                            Text('코딩',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black),)
                          ],
                        )
                    ),

                    CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                        onPressed: () {},
                        child: Column(
                          children: [Container(
                            width: width*0.15,
                            height: height*0.08,
                            decoration:  const BoxDecoration(
                              image:
                              DecorationImage(
                                image: AssetImage('assets/design_emoji.png'),
                              ),
                            ),
                          ),
                            Text('디자인',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black),)
                          ],
                        )
                    ),

                    CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                        onPressed: () {
                        },
                        child:
                        Column(
                          children: [Container(
                            width: width*0.15,
                            height: height*0.08,
                            decoration:  const BoxDecoration(
                              image:
                              DecorationImage(
                                image: AssetImage('assets/sports_emoji.png'),
                              ),
                            ),
                          ),
                            Text('운동',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black),)
                          ],
                        )
                    )
                  ],
                ),
                ),
              Container(
                height: height*0.16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                        onPressed: () {},
                        child: Column(
                          children: [Container(
                            width: width*0.15,
                            height: height*0.08,
                            decoration:  const BoxDecoration(
                              image:
                              DecorationImage(
                                image: AssetImage('assets/vocal_emoji.png'),
                              ),
                            ),
                          ),
                            Text('보컬',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black),)
                          ],
                        )
                    ),
                    CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Container(
                              width: width*0.15,
                              height: height*0.08,
                              decoration:  const BoxDecoration(
                                image:
                                DecorationImage(
                                  image: AssetImage('assets/dance_emoji.png'),
                                ),
                              ),
                            ),
                            Text('댄스',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black),)
                          ],
                        )
                    ),

                    CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                        onPressed: () {},
                        child: Column(
                          children: [Container(
                            width: width*0.15,
                            height: height*0.08,
                            decoration:  const BoxDecoration(
                              image:
                              DecorationImage(
                                image: AssetImage('assets/acting_emoji.png'),
                              ),
                            ),
                          ),
                            Text('연기',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black),)
                          ],
                        )
                    ),

                    CupertinoButton(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                        onPressed: () {},
                        child: Column(
                          children: [Container(
                            width: width*0.15,
                            height: height*0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey
                            ),
                          ),
                            Text('뭐지',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black),)
                          ],
                        )
                    )
                  ],
                ),
                ),

                CupertinoButton(
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                        margin: EdgeInsets.fromLTRB(20,0,20,0),
                        width: width*0.8,
                          height: height*0.15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey
                        ),
                      ),
                        Text('뭐지',
                          style: TextStyle(
                              fontSize: height * 0.02,
                              color: Colors.black),)
                      ],
                    )
                ),

                CupertinoButton(
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20,0,20,0),
                          width: width*0.8,
                          height: height*0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey
                          ),
                        ),
                        Text('뭐지',
                          style: TextStyle(
                              fontSize: height * 0.02,
                              color: Colors.black),)
                      ],
                    )
                ),

              ],
            ),


    );
  }
}