import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/home.dart';
import 'package:quiz/result.dart';

import 'p_questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> answerSelected = [];

  Widget? activeScreen;

  void chooseAnswer(String answer) {
    answerSelected.add(answer);
    if (answerSelected.length == questions.length) {
      setState(() {
        log(answerSelected.toString());
        activeScreen = Result(answerSelected);
        answerSelected = [];
      });
    }
  }
  // create a function to onPressed in PageQuestions
  //and add answer to answerSelected list and print to console log answer selected by user .

  @override
  void initState() {
    super.initState();
    activeScreen = Home(changeScreen);
  }

  void changeScreen() {
    setState(() {
      activeScreen = PageQuestions(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent,
              Colors.purpleAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
