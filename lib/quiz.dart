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

  Widget? activeScreen;

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
        selectedAnswers = [];
        activeScreen =  ResultScreen(chosenAnswers: [],);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
     Widget screenWidget = StartScreen(switchScreen, startQuiz: () {  },);

     if(activeScreen == QuestionScreen(onSelectAnswer: chooseAnswer)){
       screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
     }

     if(screenWidget == ResultScreen) {
      screenWidget =  ResultScreen(chosenAnswers: selectedAnswers,);
     }

    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.lightBlue.shade400,
        body: activeScreen,
      ),
    );
  }
}
