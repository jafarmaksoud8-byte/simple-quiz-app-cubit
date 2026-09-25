import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/core/constant/app_color.dart';
import 'package:project_2/cubit/quizz_cubit.dart';
import 'package:project_2/features/quizz/data/question_data.dart';
import 'package:project_2/features/quizz/ui/widgets/button_widget.dart';
import 'package:project_2/features/quizz/ui/widgets/dialog_widget.dart';
import 'package:project_2/features/quizz/ui/widgets/question_widget.dart';
import 'package:project_2/features/quizz/ui/widgets/text_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<QuizzCubit>().resetQuizz();
  }
/*
flutter_bloc من مكتبة  widget هو : Bloclistener
يسمع لتغيرات الحالة
(Side Effect)  عندما تتغير الحالة  ينفذ كود معين مرة واحدة
  UI ل  rebuild  ما بيعمل      
 snackBar مثال: عرض النوافذ أو التنقل أو 
*/
  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizzCubit, QuizzState>(
      listener: (context, state) {
        if (state is QuizzFinishedState) {
          final isPassed = state.score >= 5;
          final result = isPassed ? 'Passed' : 'Failed';
          showDialog(
            context: context,
            builder: (context) {
              return DialogWidget(
                text: '$result | score is: ${state.score}',
                color: isPassed
                    ? AppColor.kPrimaryColor6
                    : AppColor.kPrimaryColor7,
                onReset: () {
                  Navigator.pop(context);
                  context.read<QuizzCubit>().resetQuizz();
                },
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.kPrimaryColor1,
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor1,
          centerTitle: true,
          title: TextWidget(text: 'Simple Quizz App', fontSize: 30),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<QuizzCubit, QuizzState>(
                  builder: (context, state) {
                    if (state is QuizzChangedState) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: 'Question ${state.questionIndex + 1}/10',
                          fontSize: 25,
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: 30),
                BlocBuilder<QuizzCubit, QuizzState>(
                  builder: (context, state) {
                    if (state is QuizzChangedState) {
                      return QuestionWidget(
                        text: questions[state.questionIndex].text,
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                SizedBox(height: 30),

                BlocBuilder<QuizzCubit, QuizzState>(
                  builder: (context, state) {
                    if (state is QuizzChangedState) {
                      return Column(
                        children: questions[state.questionIndex].answer.indexed.map(
                          //{index,element} تقوم بتحويل القائمة الى قائمة من الازواج  map تستخدم مع  indexed
                          (e) {
                            //هو الزوج e
                            final index = e.$1; //العنصر الاول من الزوج
                            final answer = e.$2; //العنصر الثاني من الزوج
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ButtonWidget(
                                text: answer.text,
                                width: 200,
                                height: 60,
                                onSelected: () {
                                  context.read<QuizzCubit>().selectedAnswer(
                                    index,
                                  );
                                },
                                isSelected: index == state.answerSelectedIndex,
                              ),
                            );
                          },
                        ).toList(),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
                BlocBuilder<QuizzCubit, QuizzState>(
                  builder: (context, state) {
                    if (state is QuizzChangedState) {
                      if (state.questionIndex < questions.length - 1) {
                        return ButtonWidget(
                          text: 'Next',
                          width: double.infinity,
                          height: 80,
                          onSelected: () {
                            context.read<QuizzCubit>().nextQuestion();
                          },
                        );
                      } else {
                        return ButtonWidget(
                          text: 'Submit',
                          width: double.infinity,
                          height: 80,
                          onSelected: () {
                            context.read<QuizzCubit>().submitQuizz();
                          },
                        );
                      }
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
