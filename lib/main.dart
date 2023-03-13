import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:frivia/pages/app_home.dart';
import 'package:frivia/pages/quiz_home.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'ArchitectDaughter',
        primarySwatch: Colors.blue,
      ),
      home: appHome(),
      
    );
  }
}
