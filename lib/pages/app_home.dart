import 'package:flutter/material.dart';
import 'package:frivia/pages/quiz_home.dart';

class appHome extends StatefulWidget {
  @override
  State<appHome> createState() => _appHomeState();
}

class _appHomeState extends State<appHome> {
  double? deviceWidth;

  double? deviceHeight;

  double currentSliderValue = 0;
  String difficultyLevel = 'easy';

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    displayAppName(),
                    displayDifficultyLevel(),
                  ],
                ),
                difficultySlider(),
                startButton()
              ]),
        ),
      ),
    );
  }

  Widget displayAppName() {
    return Text(
      'Frivia',
      style: TextStyle(
          fontSize: 40, color: Colors.white, fontWeight: FontWeight.w500),
    );
  }

  Widget displayDifficultyLevel() {
    return Text(difficultyLevel,
        style: TextStyle(fontSize: 20, color: Colors.white));
  }

  Widget startButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(difficultyLevel: difficultyLevel),));
      },
      child: Text('Start', style: TextStyle(fontSize: 20, color: Colors.white)),
      minWidth: deviceWidth! * 0.75,
      color: Colors.blue,
      height: deviceHeight! * .10,
    );
  }

  Widget difficultySlider() {
    return Slider(
      value: currentSliderValue,
      max: 2,
      divisions: 2,
      label: currentSliderValue == 0
          ? 'Easy'
          : currentSliderValue == 1
              ? 'Medium'
              : 'Difficult',
      onChanged: (double value) {
        setState(() {
          // print(currentSliderValue);
          currentSliderValue = value;
          difficultyLevel = currentSliderValue == 0
              ? 'Easy'
              : currentSliderValue == 1
                  ? 'Medium'
                  : 'Difficult';
        });
      },
    );
  }
}
