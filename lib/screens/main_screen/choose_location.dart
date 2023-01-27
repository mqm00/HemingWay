// TODO Implement this library.import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'loading_screen.dart';
import 'coding_detail.dart';

class choose_location extends StatelessWidget {

  choose_location({Key? key, required this.checked, required this.field}) : super(key: key);
  List<String> checked;
  String field;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     body:
        getLocation(checked: checked, field:field)
    );
  }
}


class getLocation extends StatefulWidget{
  getLocation({Key? key, required this.checked, required this.field}) : super(key: key);
  List<String> checked;
  String field;

  @override
  State<StatefulWidget> createState() => _getLocation();
}

class _getLocation extends State<getLocation>{

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

  // 시군구 리스트
  final List<String> _sidoList = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
  final List<String> _seoul = ["구/군 선택","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
  final List<String> _incheon = ["구/군 선택","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
  final List<String> _daejoen = ["구/군 선택","대덕구","동구","서구","유성구","중구"];
  final List<String> _gwangju = ["구/군 선택","광산구","남구","동구","북구","서구"];
  final List<String> _daegu = ["구/군 선택","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
  final List<String> _ulsan = ["구/군 선택","남구","동구","북구","중구","울주군"];
  final List<String> _busan = ["구/군 선택","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
  final List<String> _gyeonggi = ["구/군 선택","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
  final List<String> _gangwon = ["구/군 선택","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
  final List<String> _chungbuk = ["구/군 선택","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
  final List<String> _chungnam = ["구/군 선택","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
  final List<String> _jeonbuk = ["구/군 선택","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
  final List<String> _jeonnam = ["구/군 선택","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
  final List<String> _gyeongbuk =["구/군 선택","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
  final List<String> _gyeongnam = ["구/군 선택","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
  final List<String> _jeju = ["구/군 선택","서귀포시","제주시","남제주군","북제주군"];

  String _selectedSido = '시/도 선택';
  String _selectedGuGun = '구/군 선택';
  List<String> _GuGunList = [];
  //String? _address;

  Widget _GuGunSelect(String sido) { //구군 드롭다운 아이템 만들기
    if (sido == '서울특별시') { _GuGunList = _seoul; }
    else if (sido == '인천광역시') { _GuGunList = _incheon; }
    else if (sido == '대전광역시') { _GuGunList = _daejoen; }
    else if (sido == '광주광역시') { _GuGunList = _gwangju; }
    else if (sido == '대구광역시') { _GuGunList = _daegu; }
    else if (sido == '울산광역시') { _GuGunList = _ulsan; }
    else if (sido == '부산광역시') { _GuGunList = _busan; }
    else if (sido == '경기도') { _GuGunList = _gyeonggi; }
    else if (sido == '강원도') { _GuGunList = _gangwon; }
    else if (sido == '충청북도') { _GuGunList = _chungbuk; }
    else if (sido == '충청남도') { _GuGunList = _chungnam; }
    else if (sido == '전라북도') { _GuGunList = _jeonbuk; }
    else if (sido == '전라남도') { _GuGunList = _jeonnam; }
    else if (sido == '경상북도') { _GuGunList = _gyeongbuk; }
    else if (sido == '경상남도') { _GuGunList = _gyeongnam; }
    else if (sido == '제주도') { _GuGunList = _jeju; }
    else { _GuGunList = ['구/군 선택']; }
    return DropdownButton<String>(
      isExpanded: true,
      value: _selectedGuGun,
      items: _GuGunList.map((value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedGuGun = value!;
          // print('selected $sido $_selectedGuGun');
        });
      },
    );
  }

  String location (){ //전체 주소를 string으로 리턴하는 함수

    String local;

    if (_selectedSido != '시/도 선택' && _selectedGuGun != '구/군 선택'){
      local = "$_selectedSido $_selectedGuGun";
      return local;
  }
    return '';

}

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    String local = location();

    return Scaffold(

        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),

        body: Column(

          children: [
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //   children:[
            // SizedBox(
            //   width: width*0.2,
            //   height: height*0.15,
            //   child:
            //   IconButton(
            //     onPressed: () {
            //       Navigator.of(context, rootNavigator: true).pop(context);
            //     },
            //     icon: const Icon(Icons.arrow_back),color: Colors.black,),
            // )]),
        Row(
            children:
            [Padding(padding: EdgeInsets.only(left:width*0.07, top: height * 0.03),
              child: Text('지역을 선택해주세요',
                style: TextStyle(fontSize: height*0.035),),
            )]),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(padding: EdgeInsets.only(top:height*0.05)),

                Text('시/도 를 선택해주세요',
                  style: TextStyle(fontSize: height*0.025),),

                Container(
                    margin: EdgeInsets.fromLTRB(0, height*0.02, 0, height*0.05),
                  width: width * 0.8,
                  height: height*0.08,

                    child:
                DropdownButton(
                  isExpanded: true,
                    value: _selectedSido,
                    items: _sidoList.map((value){
                      return DropdownMenuItem(
                        value: value,
                          child: Text(value));
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedSido = value!;
                        _selectedGuGun = '구/군 선택';
                      });
                    }
                )
                ),
                Text('구/군을 선택해주세요',
                  style: TextStyle(fontSize: height*0.025),),
                Container(
                  margin: EdgeInsets.fromLTRB(0, height*0.02, 0, height*0.05),
                  width: width * 0.8,
                  height: height*0.08,
                  child:
                  _GuGunSelect(_selectedSido),
                ),

                Text('선택하신 지역', style: TextStyle(fontSize: height*0.025)),

                Container(
                    margin: EdgeInsets.fromLTRB(0, height*0.02, 0, height*0.05),
                    width: width * 0.8,
                    height: height*0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black45)),
                  child:
                    Padding(
                      padding: EdgeInsets.all(height*0.02),
                      child:
                        Text(local,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: height*0.025),)
                    )
                )

              ],
            ),


            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [Padding(
                  padding: EdgeInsets.fromLTRB(0, height*0.015, 0, height*0.05),
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.6,
                    child: ElevatedButton(
                      child: Text('다음', style: TextStyle(fontSize: height*0.02, color: Colors.black)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey[300])
                      ),
                      onPressed: () {
                        if(_selectedSido == '시/도 선택'){
                          _showAlert(title: "지역 선택 안함", message: "시/도를 선택해주세요");
                        }
                        else if (_selectedGuGun == '구/군 선택'){
                          _showAlert(title: "지역 선택 안함", message: "구/군을 선택해주세요");
                        }
                        else{
                          // String sido = '';
                          // String gugun = '';

                          Navigator.push(context, CupertinoPageRoute(builder:(context) => LoadingScreen(coding_checked : widget.checked, sido: _selectedSido, gugun : _selectedGuGun, field: widget.field)));
                        }
                      },
                    ),
                  ),
                )
                ]
            )
    ]
        ));
  }
}
