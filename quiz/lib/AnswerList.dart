import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Answerlist extends StatelessWidget {
  const Answerlist(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: data['user_answer']==data['correct_answer']? Color.fromARGB(255, 12, 226, 215):Color.fromARGB(255, 243, 10, 243),
                      borderRadius:BorderRadius.circular(25)
                    ),
                      child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: TextStyle(color: Color.fromARGB(255, 5, 5, 5), fontSize: 18),
                  )),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(color: Color.fromARGB(255, 93, 245, 87), fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
