import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                height: 300,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Learn Flutter the fun way !',
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: () {
                  startQuiz();
                },
                label: const Text('Start Quiz',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                icon: const Icon(Icons.arrow_right_alt),
              )
            ],
          );
  }
}