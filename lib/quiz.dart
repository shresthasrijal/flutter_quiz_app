import 'package:flutter/material.dart';
import 'package:proj2_quiz_app/front_page.dart';
import 'package:proj2_quiz_app/question_screen.dart';
import 'package:proj2_quiz_app/results_screen.dart';
import 'package:proj2_quiz_app/data/questions.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}


class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = []; // list where the users answers should be stored
  
  @override
  void initState() {
    activeScreen = FrontPage(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      // activeScreen = 'questions-screen';
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer,);
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      // add a result screen 
      setState( () {
        // selectedAnswers = []; //will be added later again since result screen
        activeScreen = ResultScreen(selectedAnswers, switchScreen);
      }
      );
    }
  }


  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.purple,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          ),
          // child: activeScreen == 'start-screen' ? FrontPage(switchScreen) : const QuestionScreen(), 
          child: activeScreen,
        ),
      ),
    );
  }
}