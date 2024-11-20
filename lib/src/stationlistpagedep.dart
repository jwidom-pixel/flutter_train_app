import 'package:flutter/material.dart';

Widget stationList(String station) {
    return Container(
            width: 500,
            height: 50,
            color: Colors.transparent,
            child: Container(
            decoration: BoxDecoration(
              border: Border(
              bottom: BorderSide(
              color: Colors.grey[300]!,  // 테두리 색
              width: 1.0,           // 테두리 두께
              ),
              ),
              ), 
            width: 500,
            height: 50,
            child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: 
            Text(
            station,
            style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            ),
            ),
            );
}

//HomePage class
class StationListPageDep extends StatelessWidget {
  const StationListPageDep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//앱바
      appBar: AppBar(
//뒤로가기 아이콘 수정
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pop(context); // 뒤로 가기 동작
          },
        ),
//타이틀
        title: const Text('출발역'),
        centerTitle: true,
      ),

//바디
      body: Column(
      children: [
//바디; 수서
      GestureDetector(onTap: (){Navigator.pop(context, '수서');},
            child: stationList('수서')
            ),
//
//바디; 동탄
      GestureDetector(onTap: (){Navigator.pop(context, '동탄');},
            child: stationList('동탄')
            ),
//
//바디; 평택지제
      GestureDetector(onTap: (){Navigator.pop(context, '평택지제');},
            child: stationList('평택지제')
            ),
//
//바디; 천안아산
      GestureDetector(onTap: (){Navigator.pop(context, '천안아산');},
            child: stationList('천안아산')
            ),
//
//바디; 오송
      GestureDetector(onTap: (){Navigator.pop(context, '오송');},
            child: stationList('오송')
            ),
//
//바디; 대전
      GestureDetector(onTap: (){Navigator.pop(context, '대전');},
            child: stationList('대전')
            ),
//
//바디; 김천구미
      GestureDetector(onTap: (){Navigator.pop(context, '김천구미');},
            child: stationList('김천구미')
            ),
//
//바디; 동대구
      GestureDetector(onTap: (){Navigator.pop(context, '동대구');},
            child: stationList('동대구')
            ),
//
//바디; 경주
      GestureDetector(onTap: (){Navigator.pop(context, '경주');},
            child: stationList('경주')
            ),
//
//바디; 울산
      GestureDetector(onTap: (){Navigator.pop(context, '울산');},
            child: stationList('울산')
            ),
//
//바디; 부산
      GestureDetector(onTap: (){Navigator.pop(context, '부산');},
            child: stationList('부산')
            ),
//
      ]
      )
    );
  }
}