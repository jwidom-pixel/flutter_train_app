// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//HomePage class
class SeatPage extends StatelessWidget {
  SeatPage({super.key, required this.dep, required this.arr});

final String dep; // 출발역
final String arr; // 도착역
final int seatNum = 0;
final String seatAlphabet = 'z';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//앱바
      appBar: AppBar(
//뒤로가기 아이콘 수정
      leading: IconButton(
      icon: Icon(
      Icons.arrow_back_ios_new,
      ),
      onPressed: () {
      Navigator.pop(context); // 뒤로 가기 동작
      },),
      title: Text('좌석 선택'),
      centerTitle: true,
      ),
//
//바디
      body:SingleChildScrollView(
      child: 
      Column(
      children: [
//선택역 표시
      Center(child: 
      Row(
      mainAxisAlignment: MainAxisAlignment.center,  
      children: [
Spacer(),
//출발역 표시
      Text(dep,style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
               color: Colors.purple,),),
//
Spacer(),
//화살표 아이콘
      IconButton(icon: Icon(
               Icons.arrow_circle_right_outlined,
               size: 30,),
               onPressed: () {},),
//
Spacer(),
//도착역 표시
      Text(arr,style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
               color: Colors.purple,),),
Spacer(),
      ],),),
//
//좌석 상태 박스
Container(
height: 48,
child: 
Center(child: 
  Row(
  mainAxisAlignment: MainAxisAlignment.center,  
  children: [
//좌석 상태 박스; 선택됨
  Padding(padding: EdgeInsets.all(10.0),
  child:
  Container(
  width: 24,
  height: 24,
  decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(8))
  ),
  ),
  Text('선택됨'),
//
Container(width: 20,),
//좌석 상태 박스; 선택안됨
  Padding(padding: EdgeInsets.all(10.0),
  child:
  Container(
  width: 24,
  height: 24,
  decoration: BoxDecoration(color: Colors.grey[300]!, borderRadius: BorderRadius.circular(8))
  ),
  ),
  Text('선택안됨')
  ],
  )
  )
),
//여백 지정; 8
Container(height: 20),
Center(child: 
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(width: 45,),
Container(width: 58, child: Text('A',style: TextStyle(fontSize: 18))),
Container(width: 58, child: Text('B',style: TextStyle(fontSize: 18))),
Container(width: 45,),
Container(width: 58, child: Text('C',style: TextStyle(fontSize: 18))),
Container(width: 58, child: Text('D',style: TextStyle(fontSize: 18))),
])),
//여백 지정; 8
Container(height: 8),
//좌석 배치하기
      Center(child: 
      Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
//왼쪽 좌석줄
      Container(
      width: 100,
      child: 
      GridView.builder(
            shrinkWrap: true, //**오버플로우 방지**
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 한 줄에 4개 버튼 배치
              crossAxisSpacing: 4, // 버튼 간의 가로 간격
              mainAxisSpacing: 8, // 버튼 간의 세로 간격
            ),
            itemCount: 40, // 총 20개의 버튼
            itemBuilder: (context, index) {
              return Seat(); // Seat 버튼 위젯 사용
            },
            ),
            ),
//가운데 숫자
SeatCenterNum(),
//
//오른쪽 좌석줄
      Container(
      width: 100,
      child: 
      GridView.builder(
            shrinkWrap: true, //**오버플로우 방지**
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 한 줄에 4개 버튼 배치
              crossAxisSpacing: 4, // 버튼 간의 가로 간격
              mainAxisSpacing: 8, // 버튼 간의 세로 간격
            ),
            itemCount: 40, // 총 20개의 버튼
            itemBuilder: (context, index) {
              return Seat(); // Seat 버튼 위젯 사용
            },
            ),
            ),
//
            ]
            )
            ),
//
Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: SizedBox(
            width: 200,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("예매 하시겠습니까?"),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "취소",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "확인",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text(
                '예매하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          ),
//     


//여백 지정; 8
Container(height: 20),
//     
],
)
)
);
}
}

//좌석 위젯
class Seat extends StatefulWidget {@override SeatState createState() => SeatState();}
//
//좌석 위젯; 클릭 시 색 바꾸기
class SeatState extends State<Seat> {
  
bool isSelected = false;
bool seatSelected = false;

void toggleColor() {setState(() {isSelected = !isSelected;
// isSelected가 true일 때 seatSelected도 true로 설정
      seatSelected = isSelected;});}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleColor,
      child: 
      Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
//좌석 위젯; 클릭 시 색 바꾸기; 색상 변경
      color: isSelected ? Colors.purple : Colors.grey[300],
      borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      ),
      );
      }
      }
//
//가운데 좌석 숫자 표시
class SeatCenterNum extends StatelessWidget {
  const SeatCenterNum({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(20, (index) {
        return Padding(
          padding: EdgeInsets.all(3),
          child: 
          Container(
          width: 50,
          height: 50,
          child: Center(
            child: Text(
              (index + 1).toString(), // '1', '2', '3' 등 동적으로 설정
              style: TextStyle(fontSize: 20), // 글자 크기 설정
            ),
          ),
        )
        );
      }),
    );
  }
}
