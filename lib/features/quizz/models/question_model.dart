//question: text + list of answer
//answer: text+ isCorrect
class Question {
  final String text;
  final List<Answer> answer;

  Question({required this.text, required this.answer});
}

class Answer {
  final String text;
  final bool isCorrect;

  Answer({required this.text, required this.isCorrect});
}
