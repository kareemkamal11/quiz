import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result(this.answerSelected, {super.key});

  final List<String> answerSelected;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    // return Container from PageQuestions here
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have answered all questions',
            ),
            const SizedBox(height: 30),
            ...widget.answerSelected.map((answer) => Text(
                  answer,
                  style: const TextStyle(),
                )),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
