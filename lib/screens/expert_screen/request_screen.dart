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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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




                  //datePicker doit
                  /*CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.range,
                  ),
                  onValueChanged: (dates) => _yourHandler(dates),
                    initialValue: [],
                  ),*/
                ],
              )
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
