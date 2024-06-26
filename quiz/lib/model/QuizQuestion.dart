// import 'package:flutter/material.dart';

class QuizQuestion {
  final String text;
  final List<String> answers;
  const QuizQuestion(this.text, this.answers);
  @override
  String toString() {
    return 'Question:$text\nAnswers: $answers';
  }
}