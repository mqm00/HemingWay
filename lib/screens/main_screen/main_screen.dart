import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coding_detail.dart';


// void main() {
//   runApp(MyApp());
// }

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
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   backgroundColor: Colors.transparent,
      // ),
      child :
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(25, 60.0, 0, 10),
              child: Text('안녕하세요\n어떤 일이 필요하신가요?',
                  style: TextStyle(/*fontFamily: 'SCDream',*/
                    fontSize: 25,))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                  onPressed: () {},
                  child: Column(
                    children: [
                      Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          image:
                          DecorationImage(
                              image: AssetImage('assets/school_emoji.png')
                          ),
                      ),
                        
                    ),
                      const Text('과외',
                        style: TextStyle(
                          fontSize: 12,
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
                        width: 50,
                        height: 50,
                        decoration:  const BoxDecoration(
                          image:
                          DecorationImage(
                              image: AssetImage('assets/coding_emoji.png'),
                          ),
                        ),
                      ),
                      const Text('코딩',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black),)
                    ],
                  )
              ),

              CupertinoButton(
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                  onPressed: () {},
                  child: Column(
                    children: [Container(
                      width: 50,
                      height: 50,
                      decoration:  const BoxDecoration(
                        image:
                        DecorationImage(
                          image: AssetImage('assets/design_emoji.png'),
                        ),
                      ),
                    ),
                      const Text('디자인',
                        style: TextStyle(
                            fontSize: 12,
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
                      width: 50,
                      height: 50,
                      decoration:  const BoxDecoration(
                        image:
                        DecorationImage(
                          image: AssetImage('assets/sports_emoji.png'),
                        ),
                      ),
                    ),
                      const Text('운동',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black),)
                    ],
                  )
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                  onPressed: () {},
                  child: Column(
                    children: [Container(
                      width: 50,
                      height: 50,
                      decoration:  const BoxDecoration(
                        image:
                        DecorationImage(
                          image: AssetImage('assets/vocal_emoji.png'),
                        ),
                      ),
                    ),
                      const Text('보컬',
                        style: TextStyle(
                            fontSize: 12,
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
                      width: 50,
                      height: 50,
                      decoration:  const BoxDecoration(
                        image:
                        DecorationImage(
                          image: AssetImage('assets/dance_emoji.png'),
                        ),
                      ),
                    ),
                      const Text('댄스',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black),)
                    ],
                  )
              ),

              CupertinoButton(
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                  onPressed: () {},
                  child: Column(
                    children: [Container(
                      width: 50,
                      height: 50,
                      decoration:  const BoxDecoration(
                        image:
                        DecorationImage(
                          image: AssetImage('assets/acting_emoji.png'),
                        ),
                      ),
                    ),
                      const Text('연기',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black),)
                    ],
                  )
              ),

              CupertinoButton(
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                  onPressed: () {},
                  child: Column(
                    children: [Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey
                      ),
                    ),
                      const Text('뭐지',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black),)
                    ],
                  )
              )
            ],
          ),

          CupertinoButton(
            //borderRadius: BorderRadius.all(Radius.circular(10)),
              onPressed: () {},
              child: Column(
                children: [Container(
                  margin: EdgeInsets.only(left: 12),
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey
                  ),
                ),
                  const Text('뭐지',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black),)
                ],
              )
          ),

          CupertinoButton(
            //borderRadius: BorderRadius.all(Radius.circular(10)),
              onPressed: () {},
              child: Column(
                children: [Container(
                  margin: EdgeInsets.only(left: 12),
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey
                  ),
                ),
                  const Text('뭐지',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black),)
                ],
              )
          )

        ],
      ),
    );
  }
}