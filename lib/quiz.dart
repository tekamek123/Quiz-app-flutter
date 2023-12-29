import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/screens/questions_screen.dart';
import 'package:flutter_adv_basics/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

Widget? activeScreen;

@override
  void initState() {
    activeScreen = StartScreen( switchScreen, startQuiz: () {
        setState(() {
          activeScreen = const QuestionScreen();
        });
      }, );
    super.initState();
  }

void switchScreen() {
  setState(() {
    activeScreen = const QuestionScreen();
  });
}

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.lightBlue.shade400,
        body: activeScreen,
      ),
    );
  }
}