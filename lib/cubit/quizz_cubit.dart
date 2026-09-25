import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_2/features/quizz/data/question_data.dart';

part 'quizz_state.dart';

class QuizzCubit extends Cubit<QuizzState> {
  int questionIndex = 0;
  int score = 0;
  List<int?> answers = List.filled(questions.length, null);
  QuizzCubit() : super(QuizzInitialState());

  void selectedAnswer(int index) {
    if (state is QuizzChangedState) {
      answers[questionIndex] = index;
      emit(
        QuizzChangedState(
          questionIndex: questionIndex,
          answerSelectedIndex: index,
        ),
      );
    }
  }

  void nextQuestion() {
    if (state is QuizzChangedState) {
      final currentState = state as QuizzChangedState;
      if (currentState.answerSelectedIndex != null) {
        if (questionIndex < questions.length - 1) {
          questionIndex++;
          emit(QuizzChangedState(questionIndex: questionIndex));
        }
      }
    }
  }

  void submitQuizz() {
    score = 0;
    if (state is QuizzChangedState) {
      for (int i = 0; i < questions.length; i++) {
        final answer = answers[i];
        if (answer != null) {
          final correcteAnswer = questions[i].answer.indexWhere(
            (element) => element.isCorrect,
          );
          if (answer == correcteAnswer) {
            score++;
          }
        }
      }
      emit(QuizzFinishedState(questionIndex: questionIndex, score: score));
    }
  }

  void resetQuizz() {
    questionIndex = 0;
    score = 0;
    answers = List.filled(questions.length, null);
    emit(QuizzChangedState(questionIndex: 0));
  }
}
