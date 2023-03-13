import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class gameProvider extends ChangeNotifier {
  BuildContext context;
  List? resultList;
  bool? answer;
  final Dio dio = Dio();
  int itemCount = 0;
  int? maxQuestions;
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
    maxQuestions = resultList?.length;
    notifyListeners();
  }

  String? getQuestion() {
    print("This is question[${itemCount}]");

    return resultList?[itemCount]['question'];
  }

  Future<void> evaluateAnswer(String answer) async {
    bool isCorrect = (resultList?[itemCount]['correct_answer'] == answer);
    itemCount++;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: isCorrect ? Colors.green[500] : Colors.red[500],
          icon: isCorrect ? Icon(Icons.check_circle) : Icon(Icons.cancel),
        );
      },
    );
    await Future.delayed(Duration(seconds: 1));
    Navigator.pop(context);
    if (itemCount == maxQuestions!) {
      print("item count inside if else-if ${itemCount}");
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.blue,
              title: Text('Game over.'),
              content: Text('Score 0/0'),
            );
          });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pop(context);
      Navigator.pop(context);

    } else {
      print("item count inside if else-else ${itemCount}");
      notifyListeners();
    }
  }
}
