import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'choose_location.dart';
import 'CheckBoxModel.dart';

class Coding1 extends StatelessWidget {

   Coding1({Key? key, required this.field}) : super(key: key);

  String field;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      CheckBoxWidget(field: field),
    );
  }
}

class CheckBoxWidget extends StatefulWidget{

  CheckBoxWidget({Key? key, required this.field}) : super(key: key);
  String field;
  //앞 화면에서 '코딩'을 선택한 사람들에게 field 가 'CS'인 판매자들을 보여줌.

  @override
  State<StatefulWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget>{



  late List<CheckBoxModel> checked ;

  List <CheckBoxModel> checkBoxList = [
    CheckBoxModel(title: 'C'),
    CheckBoxModel(title: 'C++'),
    CheckBoxModel(title: 'C#'),
    CheckBoxModel(title: 'JAVA'),
    CheckBoxModel(title: 'JAVASCRIPT'),
    CheckBoxModel(title: 'PYTHON'),
    CheckBoxModel(title: 'KOTLIN'),
    CheckBoxModel(title: 'MATHLAB'),
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

  // List <CheckBoxModel.dart> what_check(List<CheckBoxModel.dart> list){
  //   list.any((element) => )
  //   return list;
  // }


  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
      designSize: Size(360,640),

        builder: (BuildContext context, Widget? child)
        {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black
              ),
              backgroundColor: Colors.white,
              elevation: 0.5,
            ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   width: width*0.2,
          //   height: height*0.15,
          //   child:
          //   IconButton(
          //     onPressed: () {
          //       Navigator.of(context, rootNavigator: true).pop(context);
          //     },
          //     icon: const Icon(Icons.arrow_back_outlined),color: Colors.black,),
          // ),
         Padding(padding: EdgeInsets.only(left:width*0.07, top: height * 0.05, bottom: height * 0.03),
            child: Text('어떤 언어를 의뢰하시나요?',
              style: TextStyle(fontSize: height*0.035),),
          ),

        Flexible(
            child:ListView(
          children: checkBoxList.map(buildACheckBox).toList(),
        )),

              Align(
                alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 50.h, 0, 50.h),
                  child: SizedBox(
                    height: height * 0.06,
                    width: width * 0.6,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[300])
                    ),
                    onPressed: () {
                      List<String> checked2 = List.empty(growable: true);
                      if(checkBoxList.any((x) => x.value)) { //하나라도 체크된 게 있으면 페이지 넘어감
                        checked =
                            checkBoxList.where((element) => element.value == true ).toList();
                        checked.forEach((element) {checked2.add(element.title);});
                        print(checked2.length);
                        Navigator.push(context, CupertinoPageRoute(builder:(context) => choose_location(checked : checked2, field: widget.field)));
                      }
                    else{ // 없으면 alert 띄움
                      _showAlert(title: "선택사항 없음", message: "최소 1개 이상을 선택해주세요");
                    }},
                    child: const Text('다음', style: TextStyle(color: Colors.black)),
                  ),
                ),
              )
        )
        ],
      ),
    );
        }
        );
  }

  Widget buildACheckBox(CheckBoxModel checkBox) {
    return Transform.scale(
      scale: 1,
        child: CheckboxListTile(
          contentPadding: EdgeInsets.fromLTRB(50.w, 10.h, 55.w, 0),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.black45,
          value: checkBox.value,
      title: Text(
        checkBox.title,
        style: TextStyle(fontSize: 18.h),
      ),
      onChanged: (value) =>
          setState(() {
            checkBox.value = value!;
          }),
    ));
  }
}


//TODO db에 쿼리 날리기