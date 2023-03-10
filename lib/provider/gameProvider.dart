import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class gameProvider extends ChangeNotifier {
  BuildContext context;
  String? question;
  final Dio dio = Dio();
  int itemCount = 0;
  gameProvider({required this.context}) {
    dio.options.baseUrl = "https://opentdb.com/api.php";

    print("hello");
    getQuestionsFromAPI();
  }

  Future<void> getQuestionsFromAPI() async {
    var response = await dio.get('', queryParameters: {
      'amount': 10,
      'difficulty': 'easy',
      'type': 'boolean'
    });
    var jsonResponse = jsonDecode(response.toString());
    question = jsonResponse['results'][itemCount]['question'];
    notifyListeners();
  }
}
