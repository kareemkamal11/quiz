class QuizQuestion {
  final String question;
  final List<String> answers;
  // final int correctAnswer;

  List<String> getShuffledAnswers() {
    final shuffeldList = List.of(answers);
    shuffeldList.shuffle(); // shuffle list of answers 
    return shuffeldList;
  }

  const QuizQuestion(
     this.question,
     this.answers,
    // required this.correctAnswer,
  );

}
