import 'package:project_2/features/quizz/models/question_model.dart';

List<Question> questions = [
  Question(
    text: 'Who  is the owner of flutter?',
    answer: [
      Answer(text: 'Google', isCorrect: true),
      Answer(text: 'Facebook', isCorrect: false),
      Answer(text: 'Apple', isCorrect: false),
      Answer(text: 'Microsoft', isCorrect: false),
    ],
  ),

  Question(
    text: 'Flutter uses Dart programming language?',
    answer: [
      Answer(text: 'True', isCorrect: true),
      Answer(text: 'False', isCorrect: false),
    ],
  ),

  Question(
    text: 'Which widget is used to display a scrollable list in Flutter?',
    answer: [
      Answer(text: 'ListView', isCorrect: true),
      Answer(text: 'Column', isCorrect: false),
      Answer(text: 'Container', isCorrect: false),
    ],
  ),

  Question(
    text: 'Which of the following are Dart data types?',
    answer: [
      Answer(text: 'int', isCorrect: false),
      Answer(text: 'String', isCorrect: false),
      Answer(text: 'bool', isCorrect: false),
      Answer(text: 'double', isCorrect: false),
      Answer(text: 'All of the above', isCorrect: true),
    ],
  ),

  Question(
    text: 'Which of the following are mobile operating systems?',
    answer: [
      Answer(text: 'Android', isCorrect: false),
      Answer(text: 'iOS', isCorrect: false),
      Answer(text: 'KaiOS', isCorrect: false),
      Answer(text: 'Windows', isCorrect: false),
      Answer(text: 'Linux', isCorrect: false),
      Answer(text: 'All of the above', isCorrect: true),
    ],
  ),

  Question(
    text: 'What does IDE stand for?',
    answer: [
      Answer(text: 'Integrated Development Environment', isCorrect: true),
      Answer(text: 'Internal Data Engine', isCorrect: false),
      Answer(text: 'Interactive Design Element', isCorrect: false),
      Answer(text: 'Integrated Debugging Engine', isCorrect: false),
    ],
  ),

  Question(
    text: 'Is Flutter an open-source framework?',
    answer: [
      Answer(text: 'Yes', isCorrect: true),
      Answer(text: 'No', isCorrect: false),
    ],
  ),

  Question(
    text: 'Which of the following are state management solutions in Flutter?',
    answer: [
      Answer(text: 'Provider', isCorrect: false),
      Answer(text: 'BLoC', isCorrect: false),
      Answer(text: 'Cubit', isCorrect: false),
      Answer(text: 'Riverpod', isCorrect: false),
      Answer(text: 'All of the above', isCorrect: true),
    ],
  ),

  Question(
    text: 'Which company developed Swift?',
    answer: [
      Answer(text: 'Apple', isCorrect: true),
      Answer(text: 'Google', isCorrect: false),
      Answer(text: 'Microsoft', isCorrect: false),
    ],
  ),

  Question(
    text: 'What is the purpose of the pubspec.yaml file?',
    answer: [
      Answer(text: 'Manage dependencies', isCorrect: true),
      Answer(text: 'Define UI', isCorrect: false),
      Answer(text: 'Store user data', isCorrect: false),
      Answer(text: 'Compile code', isCorrect: false),
    ],
  ),
];
