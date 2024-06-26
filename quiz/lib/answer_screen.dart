import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/AnswerList.dart';
import 'package:quiz/data/question.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen(this.chosenAnswers, this.resetQuestion,{super.key});
  final List<String> chosenAnswers;
  final void Function() resetQuestion;
  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  // _AnswerScreenState(this.chosenAnswers);
  // final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < widget.chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': widget.chosenAnswers[i]
        },
      );
    }

    return summary;
  }
  
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestion = questions.length;
    final coreectQuestion = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('You answered $coreectQuestion out of $totalQuestion questions correctly!',style: TextStyle(color: Colors.white,fontSize: 24),textAlign: TextAlign.center,),
        const SizedBox(
          height: 30,
        ),
        Answerlist(summaryData),
        const SizedBox(
          height: 30,
        ),
        TextButton.icon(
          icon: const Icon(Icons.refresh,color: Colors.white,),
          onPressed: () {
            widget.resetQuestion();
          },
          label: const Text('Restart Quiz!',style: TextStyle(color: Colors.white,fontSize: 18),),
        )
      ],
    );
  }
}
