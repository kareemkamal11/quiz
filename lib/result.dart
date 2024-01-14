import 'package:flutter/material.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/summry.dart';

class Result extends StatelessWidget {
  const Result(
    this.answerSelected,
    this.restartQuiz, {
    super.key,
  });

  final List<String> answerSelected;
  final Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerSelected.length; i++) {
      summary.add({
        'question ID': i,
        'question': questions[i].question,
        'correct answer': questions[i].answers[0],
        'answer': answerSelected[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var numberOfCorrectAnswers = summaryData
        .where((element) => element['correct answer'] == element['answer'])
        .length;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          children: [
            Text(
                numberOfCorrectAnswers == summaryData.length
                    ? 'Congratulations! You answered all questions correctly'
                    : 'You answered $numberOfCorrectAnswers out of ${summaryData.length} questions correctly',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 30),
            Summary(summaryData),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed:restartQuiz,
              label: const Text('Restart Quiz'),
              icon: const Icon(
                Icons.replay,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
