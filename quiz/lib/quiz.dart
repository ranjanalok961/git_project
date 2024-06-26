import 'package:flutter/material.dart';
import 'package:quiz/QuestionScreen.dart';
import 'package:quiz/answer_screen.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/start_Screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        
        activeScreen = 'results-screen';
      });
    }
  }
  void resetQuestion(){
    selectedAnswers = [];
    if (selectedAnswers.length == 0) {
      setState(() {
        activeScreen = 'questions-screen';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = Questionscreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = AnswerScreen(selectedAnswers,resetQuestion);
    }
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromARGB(255, 55, 4, 85),
              Color.fromARGB(255, 60, 22, 109)
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(45))),
        child: Center(child: screenWidget,)
      ),
    );
  }
}