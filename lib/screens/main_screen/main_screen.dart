import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'coding_detail.dart';
import 'package:flutter/foundation.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';


// void main() {
//   runApp(MyApp());
// }

// final String iosTestId = 'ca-app-pub-3940256099942544/2934735716';
//
// BannerAd? banner;

const Map<String, String> UNIT_ID = kReleaseMode
    ? {
  'ios': '[YOUR iOS AD UNIT ID]',
  'android': '[YOUR ANDROID AD UNIT ID]',
}
    : {
  'ios': 'ca-app-pub-3940256099942544/2934735716',
  'android': 'ca-app-pub-3940256099942544/2934735716',
};

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove debug expression
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TargetPlatform os = Theme.of(context).platform;

    BannerAd banner = BannerAd(
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (_) {},
      ),
      size: AdSize.fullBanner,
      adUnitId: UNIT_ID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
      request: AdRequest(),
    )..load();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('HemingWay', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      // navigationBar: const CupertinoNavigationBar(
      //   backgroundColor: Colors.transparent,
      // ),
            body:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.03, 0, 0),
                  height: height * 0.12,
                  child: Align(
                    alignment: Alignment.topLeft,
                      child: Text('안녕하세요!\n어떤 일을 의뢰하실건가요?',
                          style: TextStyle(/*fontFamily: 'SCDream',*/
                              fontSize: height * 0.1*0.27, fontWeight: FontWeight.bold)))),
                Container(
                  height: height*0.15,
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
                              height: height*0.07,
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
                              height: height*0.07,
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
                            height: height*0.07,
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
                            height: height*0.07,
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
                            height: height*0.07,
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
                              height: height*0.07,
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
                            height: height*0.07,
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
                            height: height*0.07,
                            decoration:  const BoxDecoration(
                              image:
                              DecorationImage(
                                image: AssetImage('assets/plussign_emoji.png'),
                              ),
                            ),
                          ),
                            Text('기타',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color: Colors.black),)
                          ],
                        )
                    )
                  ],
                ),
                ),

                Column(
                  children: [
                    Container(

                      height: 80,

                      child: AdWidget(
                        ad: banner,
                      ),
                    ),
                  ],
                ),

                // CupertinoButton(
                //   //borderRadius: BorderRadius.all(Radius.circular(10)),
                //     onPressed: () {},
                //     child: Column(
                //       children: [
                //         Container(
                //         margin: EdgeInsets.fromLTRB(width*0.05,0,width*0.05,0),
                //         width: width*0.8,
                //           height: height*0.15,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: Colors.grey
                //         ),
                //       ),
                //         Text('오늘의 추천 판매자',
                //           style: TextStyle(
                //               fontSize: height * 0.02,
                //               color: Colors.black),)
                //       ],
                //     )
                // ),

                CupertinoButton(
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                    onPressed: () {},
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(width*0.05,0,width*0.05,0),
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