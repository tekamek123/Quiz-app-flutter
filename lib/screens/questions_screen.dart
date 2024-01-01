import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/answer_button.dart';
import 'package:flutter_adv_basics/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.lightBlue.shade400,
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               Card(
                elevation: 20,
                margin: const EdgeInsets.all(2),
                shadowColor: Colors.black,
                color: Colors.lightBlueAccent.shade400,
                 child: Text(currentQuestion.question,
                  style: const TextStyle(
                  fontSize: 27.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2.0
                               ),
                               ),
               ),
              const SizedBox(height: 30,),
              AnswerButton(answerText: currentQuestion.options[0],onTap: () {},),
              const SizedBox(height: 30,),
              AnswerButton(answerText: currentQuestion.options[1], onTap: () {},),
              const SizedBox(height: 30,),
              AnswerButton(answerText: currentQuestion.options[2], onTap: () {},),
              const SizedBox(height: 30,),
              AnswerButton(answerText: currentQuestion.options[3], onTap: () {},),
            ]
          ),
        ),
      ),
      ),
    );
  }
}