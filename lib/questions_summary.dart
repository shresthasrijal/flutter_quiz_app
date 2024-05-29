import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width:30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      color: (data['user_answer'] as String) ==  (data['correct_answer'] as String) ? const Color.fromARGB(255, 7, 199, 103) : const Color.fromARGB(255, 199, 9, 136),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String, style: GoogleFonts.lato(fontSize: 16, color: Colors.white),),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      Text(data['user_answer'] as String, style: const TextStyle(fontSize: 11, color: Colors.red,)),
                      Text(data['correct_answer'] as String,  style: const TextStyle(fontSize: 11, color: Colors.greenAccent,)),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
