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
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("요청서 작성"),
            )
          ],
        ),
      )
    );
  }
}
