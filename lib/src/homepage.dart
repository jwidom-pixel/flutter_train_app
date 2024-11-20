// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'seatpage.dart';
import 'stationlistpagedep.dart';
import 'stationlistpagearr.dart';

// 홈페이지 스테이트풀위젯
class HomePage extends StatefulWidget {
HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

//홈페이지 스테이트
class HomePageState extends State<HomePage> {
  String dep = '선택';
  String arr = '선택';

// 출발역 값을 받아오는 비동기 함수
  Future<void> getSelectedDep() async {
    final selectedDep = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StationListPageDep()),
    );
    
    if (selectedDep != null) {
      setState(() {dep = selectedDep;});
    }
  }
//
// 도착역 값을 받아오는 비동기 함수
  Future<void> getSelectedArr() async {
    if (dep == '선택') {return;}
    final selectedArr = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StationListPageArr()),
    );
    
    if (selectedArr != null) {
      setState(() {arr = selectedArr;});
    }
  }
//
//출발역과 도착역 값을 전달하는 함수
Future<void> toTheSeatPage() async {
// 출발역 또는 도착역이 선택되지 않았을 경우 경고 메시지
  if (dep == '선택' || arr == '선택') {
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('출발역과 도착역을 모두 선택해주세요.')),
  );
  return;}
//SeatPage로 이동
  Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => SeatPage(dep: dep, arr: arr),
    ),
    );
    } 
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//앱바
      appBar: AppBar(
        title: Text('기차 예매'),
        centerTitle: true,
      ),
//
//바디
      backgroundColor: Colors.grey[200],
      body:
        Center(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
//바디; 첫 번째 컨테이너
          Container(
          decoration: BoxDecoration(
//바디; 첫 번째 컨테이너; 컨테이너 색상 화이트
          color: Colors.white,
//바디; 첫 번째 컨테이너; 컨테이너 모서리 둥글기
          borderRadius: BorderRadius.circular(20.0),
          ),
//바디; 첫 번째 컨테이너; 컨테이너 크기 200
          width: 380,
          height: 200,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//바디; 첫 번째 컨테이너; 출발역
            Spacer(),
//왼쪽 클릭 시 이동
          GestureDetector(
            onTap: () => getSelectedDep(),
            child: 
            Container(
            width: 150,
            height: 200,
            color: Colors.transparent,
            child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
              '출발역',
              style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              ),
              ),
//출발역 스트링
              Text(
              dep,
              style: TextStyle(fontSize: 40),
              ),
//
              ],
              ),
              ),
              ),
              ),
            
//바디; 첫 번째 컨테이너; 버티컬 디바이더
                SizedBox(
                width: 35,
                child: 
                VerticalDivider(
                color: Colors.grey[400],  // 세로선 색상
                thickness: 2,
                indent: 75,
                endIndent: 75,
                ),
                ),
//바디; 첫 번째 컨테이너; 도착역
            
//오른쪽 클릭 시 이동
          GestureDetector(
            onTap: () => getSelectedArr(),
            child:
            Container(
            width: 150,
            height: 200,
            color: Colors.transparent,
            child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
            '도착역',
            style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            ),
            ),
//도착역 스트링
            Text(
            arr,
            style: TextStyle(fontSize: 40),
            ),
//
            ],
            ),
            ),
            ),
            ),
              Spacer(),
            ],
            ),
            ),
//바디; 컨테이너 사이 여백
              SizedBox(height: 20,),
//바디; 두 번째 컨테이너
            GestureDetector(
            onTap: () => toTheSeatPage(),
            child: Container(
            width: 380,
            height: 70,
            color: Colors.transparent,
            child: Center(
            child: 
            Container(
            decoration: BoxDecoration(
//바디; 두 번째 컨테이너; 컨테이너 색상
            color: Colors.purple,
//바디; 두 번째 컨테이너; 모서리 둥글기
            borderRadius: BorderRadius.circular(20.0),
            ),
//바디; 두 번째 컨테이너; 컨테이너 크기
            child: Center(
            child: Text(
            '좌석 선택',
            style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
            )
            )
            )
            ),
      ),
     )
    ])));
  }
}
//