import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 15,),
              RichText(
                text: TextSpan(
                  text: '   희망 일정을 선택해주세요.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showDatePickerPop();
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.amberAccent,
                          )),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'DatePicker 띄우기',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
