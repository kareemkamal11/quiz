import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz/answersbutton.dart';
import 'package:quiz/data/question.dart';

class PageQuestions extends StatefulWidget {
  const PageQuestions(
    this.onPressed, {
    super.key,
  });

  final Function(String) onPressed; // create a function to onPressed

  @override
  State<PageQuestions> createState() => _PageQuestionsState();
}

class _PageQuestionsState extends State<PageQuestions> {
  int cqIndex = 0; // current question index

  void nextQuestion(String answer) {
    widget.onPressed(answer); // call onPressed function
    setState(() {
      cqIndex++; 
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestio = questions[cqIndex];
    return Container(
      margin: const EdgeInsets.all(20),
      // create column on child , and this column into a Text and 4 ElavatedButton
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textQuestion(currentQuestio.question),
          const SizedBox(height: 30),
          ...currentQuestio.getShuffledAnswers().map((answer) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              child: AnswerButton(
                answer: answer,
                onPressed: () {
                  nextQuestion(answer); // call nextQuestion function
                  log(answer);
                },
              ),
            );
          }).toList(), // convert to list because map return iterable object
        ],
      ),
    );
  }

// create a function to comopoent of the text questions

  Widget textQuestion(String question) {
    return Text(
      question,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    );
  }
}
// conver textQuestion function to a widget stateless
