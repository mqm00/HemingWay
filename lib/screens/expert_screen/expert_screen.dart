import 'package:flutter/material.dart';
import 'request_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hemingway/api/seller_info.dart';
import 'expert_api.dart';
import 'request_api.dart';

class ExpertInformation extends StatefulWidget {
  const ExpertInformation({Key? key}) : super(key: key);

  @override
  State<ExpertInformation> createState() => _ExpertInformationState();
}


class _ExpertInformationState extends State<ExpertInformation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '전문가 정보',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: ExpertApi(),
              ),
              RequestApi(),
            ],
          ),
        ),
    );
  }
}
