import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'choose_location.dart';

class Coding1 extends StatelessWidget {

  const Coding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body:
      CheckBoxWidget(),
    );
  }
}

class CheckBoxWidget extends StatefulWidget{
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget>{

  //List<String> SubjectList = ['C','C++','C#','Java','Python'];


  final checkBoxList = [
    CheckBoxModel(title: 'C'),
    CheckBoxModel(title: 'C++'),
    CheckBoxModel(title: 'C#'),
    CheckBoxModel(title: 'Java'),
    CheckBoxModel(title: 'Python'),
  ];

  //List<String> selected_list = ['','','','',''];

  //alert function
  void _showAlert({String? title, String? message}) {
    showCupertinoDialog(context: context, builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title!),
        content: Text(message!),
        actions: [
          CupertinoDialogAction(isDefaultAction: true, child: Text("확인"), onPressed: () {
            Navigator.pop(context);
          })
        ],
      );
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(child:
    CupertinoPageScaffold(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.fromLTRB(10,20.0, 0, 10),
            child:
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_sharp),color: Colors.black,),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(25,10.0, 0, 20),
            child: Text('어떤 과목을 찾으시나요?',
              style: TextStyle(fontSize: 20),),
          ),


           ...checkBoxList.map(buildACheckBox).toList(),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [Padding(
                padding: EdgeInsets.fromLTRB(0,60, 0, 50),
                child: Container(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    child: Text('다음'),
                    onPressed: () {
                      if(checkBoxList.any((x) => x.value)){ //하나라도 체크된 게 있으면 페이지 넘어감
                        Navigator.push(context, CupertinoPageRoute(builder:(context) => choose_location()),);
                      }
                      else{ // 없으면 alert 띄움
                        _showAlert(title: "선택사항 없음", message: "최소 1개 이상을 선택해주세요");
                      }

                    },
                  ),
                ),
              )
              ]
          )
        ],
      ),
    ));
  }

  Widget buildACheckBox(CheckBoxModel checkBox) => CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: Colors.black45,
    value: checkBox.value,
    title: Text(
      checkBox.title,
      style: const TextStyle(fontSize: 15),
    ),
    onChanged: (value) => setState(() {
      // if (value!){
      //   selected_list.insert(SubjectList.indexOf(checkBox.title), checkBox.title);
      // }
      // else{
      //   selected_list[SubjectList.indexOf(checkBox.title)] = '';
      // }
      checkBox.value = value!;
    }),
  );
}

class CheckBoxModel { //체크박스 각각 하나의 클래스
  String title;
  bool value;

  CheckBoxModel({required this.title, this.value = false});
}


//TODO db에 쿼리 날리기