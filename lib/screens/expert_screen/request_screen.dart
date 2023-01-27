import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';


class RequestPaper extends StatefulWidget {
  const RequestPaper({Key? key}) : super(key: key);

  @override
  State<RequestPaper> createState() => _RequestPaperState();
}

class _RequestPaperState extends State<RequestPaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '의뢰서 작성하기',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('\n     *  ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),
                    ),
                    Text('\n원하는 일정을 선택해주세요.',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          size: 35.0,
                          color: Colors.grey,
                        )
                    ),
                    TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      child: Text(
                        'ex) YY.MM.DD.HH.MM',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    //datePicker doit
                    /*CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.range,
                  ),
                  onValueChanged: (dates) => _yourHandler(dates),
                    initialValue: [],
                  ),*/


                  ],
                ),

                Padding(padding: EdgeInsets.only(left: 0.0, top: 100.0, right: 0.0, bottom: 0.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('\n     *  ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),
                    ),
                    Text('\n원하는 가격을 입력해주세요.',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.money,
                          size: 35.0,
                          color: Colors.grey,
                        )
                    ),
                    TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      child: Text(
                        '현재 측정 가격 : 50,000원',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.only(left: 0.0, top: 100.0, right: 0.0, bottom: 0.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('\n     *  ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),
                    ),
                    Text('\n추가 요구 사항',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.lightbulb,
                          size: 35.0,
                          color: Colors.grey,
                        )
                    ),
                    TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                        primary: Colors.grey,
                      ),
                      child: Text(
                        'ex) 화상으로 진행하길 원합니다.',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.only(left: 0.0, top: 100.0, right: 0.0, bottom: 0.0)),

                Positioned(
                  //width: double.infinity,
                  left: MediaQuery.of(context).size.width-450,
                  top: MediaQuery.of(context).size.height-131,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) => RequestPaper(),)
                      );
                    },
                    child: Text('의뢰하시겠습니까?', style: TextStyle(fontSize: 15, letterSpacing: 1.0),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 1.0,
                      minimumSize: Size(500, 50),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }

  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2020), //시작일
      lastDate: DateTime(2022), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      //Fluttertoast.showToast(
      // msg: dateTime.toString(),
      // toastLength: Toast.LENGTH_LONG,
      //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      //);
    });
  }



  Widget dayChoice = Container(

  );
}