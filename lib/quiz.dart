import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/data/questions.dart';
import 'package:flutter_adv_basics/screens/questions_screen.dart';
import 'package:flutter_adv_basics/screens/result_screen.dart';
import 'package:flutter_adv_basics/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  late Widget activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(
      switchScreen,
      startQuiz: () {
        setState(() {
          activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
        });
      },
    );
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
    });

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen is ResultScreen) {
      return MaterialApp(
        home: Scaffold(
          //backgroundColor: Colors.lightBlue.shade400,
          body: activeScreen,
        ),
      );
    } else {
      return MaterialApp(
        home: Scaffold(
          //backgroundColor: Colors.lightBlue.shade400,
          body: activeScreen,
        ),
      );
    }
  }
}

