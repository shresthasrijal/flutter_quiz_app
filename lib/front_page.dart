import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:proj2_quiz_app/quiz_start_button.dart';

class FrontPage extends StatelessWidget {
  
  const FrontPage(this.startQuiz, {super.key});

  final void Function() startQuiz; 

  @override
  Widget build(context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, 
        children: [
          Image.asset('assets/images/quiz-logo.png',
           width: 300,
           color: const Color.fromARGB(150, 255, 255, 255)),
          const SizedBox(height: 80,),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40,),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 16),
            ),
            icon: const Icon(Icons.accessible_forward_rounded),
            label: const Text('Start Quiz'),
          ),
        ]
        ),
      );
  }
}
