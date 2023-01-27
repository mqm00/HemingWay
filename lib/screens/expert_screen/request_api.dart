import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestApi extends StatefulWidget {
  const RequestApi({Key? key}) : super(key: key);

  @override
  State<RequestApi> createState() => _RequestApiState();
}

class _RequestApiState extends State<RequestApi> {
  final _controller = TextEditingController();
  var _userEnterPrice = '';

  void _sendPrice() {
    //보내고 다음 페이지로 넘어갈 수 있게
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance
        .collection('price')
        .add({'price': _userEnterPrice});
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: '거래 가격을 입력해주세요.'),
              onChanged: (value) {
                setState(() {
                  _userEnterPrice = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed: _userEnterPrice.trim().isEmpty ? null : _sendPrice,
            icon: Icon(Icons.send_rounded),
            color: Colors.indigo,
          )
        ],
      ),
    );
  }
}
