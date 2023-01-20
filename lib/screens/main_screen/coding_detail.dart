import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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


  final List <CheckBoxModel> checkBoxList = [
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

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
      designSize: Size(360,640),

        builder: (BuildContext context, Widget? child)
        { return CupertinoPageScaffold(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width*0.2,
            height: height*0.15,
            child:
            IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined),color: Colors.black,),
          ),
         Padding(padding: EdgeInsets.only(left:width*0.07, bottom:width*0.07),
            child: Text('어떤 과목을 찾으시나요?',
              style: TextStyle(fontSize: height*0.035),),
          ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: checkBoxList.map(buildACheckBox).toList(),
        ),

              Align(
                alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 50.h, 0, 10.h),
                  child: SizedBox(
                    height: height * 0.06,
                    width: width * 0.6,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[300])
                    ),
                    onPressed: () {if(checkBoxList.any((x) => x.value)){ //하나라도 체크된 게 있으면 페이지 넘어감
                      Navigator.push(context, CupertinoPageRoute(builder:(context) => choose_location()),);
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
      scale: 1.05,
        child: CheckboxListTile(
          contentPadding: EdgeInsets.fromLTRB(50.w, 10.h, 55.w, 0),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.black45,
          value: checkBox.value,
      title: Text(
        checkBox.title,
        style: TextStyle(fontSize: 20.h),
      ),
      onChanged: (value) =>
          setState(() {
            checkBox.value = value!;
          }),
    ));
  }
}

class CheckBoxModel { //체크박스 각각 하나의 클래스
  String title;
  bool value;

  CheckBoxModel({required this.title, this.value = false});
}


//TODO db에 쿼리 날리기