import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/answer_button.dart';
import 'package:flutter_adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion (String selectedAnswers) {
   
    widget.onSelectAnswer(selectedAnswers);

    setState(() {
      currentQuestionIndex ++;
    });
  }


  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.lightBlue.shade400,
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
               Card(
                elevation: 20,
                margin: const EdgeInsets.all(2),
                shadowColor: Colors.black,
                color: Colors.lightBlueAccent.shade400,
                 child: Text(currentQuestion.question,
                  style: GoogleFonts.lato(
                  fontSize: 27.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2.0
                   ),
                  textAlign: TextAlign.center,
                   ),
               ),
              const SizedBox(height: 30,),
              const Divider(thickness: 2, color: Colors.white,),
              const SizedBox(height: 30,),
              ...currentQuestion.getShuffledOptions().map((options) {
                return AnswerButton(answerText: options,
                onTap: (){
                  answerQuestion(options);
                });
              }),
              // AnswerButton(answerText: currentQuestion.options[0],onTap: () {},),
              // const SizedBox(height: 30,),
              // AnswerButton(answerText: currentQuestion.options[1], onTap: () {},),
              // const SizedBox(height: 30,),
              // AnswerButton(answerText: currentQuestion.options[2], onTap: () {},),
              // const SizedBox(height: 30,),
              // AnswerButton(answerText: currentQuestion.options[3], onTap: () {},),
            ]
          ),
        ),
      ),
      ),
    );
  }
}