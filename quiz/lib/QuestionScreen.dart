import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/answerButton.dart';
import 'package:quiz/data/question.dart';
import 'package:google_fonts/google_fonts.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<Questionscreen> createState() => _QuestionscreenState();
}

class _QuestionscreenState extends State<Questionscreen> {

  var tracker = 0;
  void chnageTracker(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      tracker = tracker < questions.length-1 ? tracker + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[tracker];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentquestion.text,
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 201, 153, 251),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        ...currentquestion.answers.map((ans) {
          return Answerbutton(
            answerText: ans,
            onTap: () {
              chnageTracker(ans);
            },
          );
        })
      ],
    );
  }
}
