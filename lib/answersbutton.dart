import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.answer, required this.onPressed, super.key});

  final String answer;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // style of button  forntground color is white color
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple[900],
          //circleBorder 40
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 60)),
      onPressed: onPressed,
      child: Text(answer, textAlign: TextAlign.center),
    );
  }
}
