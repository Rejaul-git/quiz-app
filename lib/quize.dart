import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/start_screen2.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  //createState function create a object that is State<Quiz>
  State<Quiz> createState() {
    return _QuizeState();
  }
}

class _QuizeState extends State<Quiz> {
  List<String> seletedAnswers = [];

  var activeScreen = 'Start_screen';
  // // void means this function will not return any
  // // at first initstate execute first and then other wedgets will execute..
  // @override
  // void initState() {
  //   activeScreen = StartScreen(swichScreen);
  //   super.initState();
  // }

  void swichScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswer(String answer) {
    seletedAnswers.add(answer);
    if (questions.length == seletedAnswers.length) {
      setState(() {
        activeScreen = 'Result_screen';
      });
    }
  }

  void reStart() {
    setState(() {
      seletedAnswers = [];
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? showScreen;
    if (activeScreen == 'Start_screen') {
      // swichScreen is a function but we pass this function inside the StartScreen as a value(SwichScreen is a
      // value or pointer)
      showScreen = StartScreen(swichScreen);
    } else if (activeScreen == 'question_screen') {
      showScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else {
      showScreen = Result(resultLlst: seletedAnswers, reStartFunc: reStart);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 39, 15, 222),
          Color.fromARGB(255, 62, 39, 234),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: showScreen,
      )),
    );
  }
}
