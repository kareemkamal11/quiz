// stateless calss home

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png', width: 300),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.amber),
              foregroundColor: Colors.white,
            ),
            onPressed: changeScreen,
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
