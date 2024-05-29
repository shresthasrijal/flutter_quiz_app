import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj2_quiz_app/data/questions.dart';
import 'package:proj2_quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.startQuiz, {super.key});

  final List<String> chosenAnswers;
  final void Function() startQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final totalQuestionsNum = questions.length;
    final correctQuestionsNum = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctQuestionsNum out of $totalQuestionsNum questions correctly.",
              style: GoogleFonts.adventPro(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: () {
                  startQuiz();
                },
                 icon: const Icon(Icons.restart_alt), 
                 label: const Text("Restart Quiz!"), 
                 style: TextButton.styleFrom(
                  foregroundColor: Colors.deepOrangeAccent,
                  // backgroundColor: Colors.white,
                  textStyle: const TextStyle( fontSize: 18)
                 ),),
          ],
        ),
      ),
    );
  }
}
