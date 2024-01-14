import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...summaryData.map((e) {
          Color status = e['correct answer'] == e['answer']
              ? Colors.green[600]!
              : Colors.red;
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: status,
                child: Text(((e['question ID'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    )),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e['question'].toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 250, 205, 254),
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 5),
                    Text(e['correct answer'].toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 49, 167, 203),
                          fontWeight: FontWeight.bold,
                        )),
                    Text(e['answer'].toString(),
                        style: TextStyle(
                          color: status,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
