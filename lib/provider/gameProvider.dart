import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class gameProvider extends ChangeNotifier {
  BuildContext context;
  List? resultList;
  bool? answer;
  final Dio dio = Dio();
  int itemCount = 0;
  gameProvider({required this.context}) {
    dio.options.baseUrl = "https://opentdb.com/api.php";

    getQuestionsFromAPI();
  }

  Future<void> getQuestionsFromAPI() async {
    var response = await dio.get('', queryParameters: {
      'amount': 10,
      'difficulty': 'easy',
      'type': 'boolean'
    });
    var jsonResponse = jsonDecode(response.toString());
    resultList = jsonResponse['results'];
    notifyListeners();
    
  }

  String? getQuestion() {
    return resultList?[itemCount]['question'];
  }

  void evaluateAnswer(bool answer) {
    print(resultList?[itemCount]['correct_answer'] == answer);
    itemCount++;
    notifyListeners();
  }
}
