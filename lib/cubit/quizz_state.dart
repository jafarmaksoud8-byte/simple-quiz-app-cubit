part of 'quizz_cubit.dart';

@immutable
sealed class QuizzState {
  final int questionIndex;

  const QuizzState({required this.questionIndex});
}

final class QuizzInitialState extends QuizzState {
  const QuizzInitialState() : super(questionIndex: 0);
}

final class QuizzChangedState extends QuizzState {
  final int? answerSelectedIndex;
  const QuizzChangedState({
    required super.questionIndex,
    this.answerSelectedIndex,
  });
}

final class QuizzFinishedState extends QuizzState {
  final int score;
  const QuizzFinishedState({required super.questionIndex, required this.score});
}
