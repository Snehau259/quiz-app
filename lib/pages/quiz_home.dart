import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  double? deviceHeight, deviceWidth;
  // const MyHomePage({super.key, required this.title});

  // final String title;
  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: gameUI(),
    );
  }

  SafeArea gameUI() {
    return SafeArea(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: deviceHeight! * 0.05,
          ),
          // color: Colors.orange[500],
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
        onPressed: () {},
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
        onPressed: () {},
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

  Widget QuestionText() => Text(
        "Test question1,nithing interesting",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
      );
}
