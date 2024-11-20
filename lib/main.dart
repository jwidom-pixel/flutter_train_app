// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'src/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//변수 기본값 지정

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: HomePage(),
    );
  }
}
