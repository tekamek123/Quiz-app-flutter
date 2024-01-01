import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
   ResultScreen({super.key, required this.chosenAnswers});

  List <String>chosenAnswers = [];

  List<Map<String, Object>> getSummaryData () {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].options[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.lightBlue.shade400,
    width: double.infinity,
    child: Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            'You answered X out of Y questions correctly!',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
          ),
           ),
          const SizedBox(height: 30),
           Text('List of answers and questions',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,),),
          const SizedBox(height: 30),
          TextButton(
            onPressed: () {},
            child:  Text('Restart Quiz!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
