import 'package:flutter/material.dart';
import 'package:frivia/provider/gameProvider.dart';
import 'package:provider/provider.dart';
import '../provider/gameProvider.dart';

class MyHomePage extends StatelessWidget {
  double? deviceHeight, deviceWidth;
  gameProvider? quizProvider;
  String? difficultyLevel;
  MyHomePage({required this.difficultyLevel});
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (providercontext) => gameProvider(context: context,difficultyLevel: difficultyLevel),
      child: buildUI(),
    );
  }

  Widget buildUI() {
    return Builder(builder: (context) {
      quizProvider = context.watch<gameProvider>();
      // print("resultList");
      // print(quizProvider?.resultList);
      if (quizProvider?.resultList != null) {
        return Scaffold(
          backgroundColor: Colors.grey[900],
          body: gameUI(),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.grey[900],
          ),
        );
      }
    });
  }

  Widget gameUI() {
    return SafeArea(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: deviceHeight! * 0.05,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                QuestionText(),
                Column(
                  children: [
                    trueButton(),
                    SizedBox(
                      height: deviceHeight! * 0.01,
                    ),
                    falseButton(),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  Widget trueButton() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color.fromARGB(255, 102, 187, 106), blurRadius: 5)
      ]),
      child: MaterialButton(
        onPressed: () {
          print("true button clicked");

          quizProvider?.evaluateAnswer("True");
        },
        color: Colors.green,
        minWidth: deviceWidth! * 0.75,
        height: deviceHeight! * .1,
        child: Text(
          "True",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget falseButton() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color.fromARGB(255, 239, 83, 80), blurRadius: 5)
      ]),
      child: MaterialButton(
        onPressed: () {
          quizProvider?.evaluateAnswer("False");
          print("false button clicked");
        },
        color: Colors.red,
        minWidth: deviceWidth! * 0.75,
        height: deviceHeight! * .1,
        child: Text(
          "False",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget QuestionText() => Container(
        child: Center(
          child: Text(
            quizProvider!.getQuestion()!,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      );
}
