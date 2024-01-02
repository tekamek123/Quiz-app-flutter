import 'package:flutter/material.dart';
import 'package:flutter_adv_basics/data/questions.dart';
import 'package:flutter_adv_basics/question_summary.dart';
import 'package:flutter_adv_basics/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers});

  List<String> chosenAnswers = [];

  List<Map<String, Object>> getSummaryData() {
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

  void restartQuiz(BuildContext context) {
    // Reset state variables or navigate to the quiz starting point
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Quiz()), // Assuming Quiz is the root widget for the quiz
    );
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    });

    return Container(
      color: Colors.lightBlue.shade400,
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered ${numCorrectAnswers.length} out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                restartQuiz(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.refresh, // Choose the desired icon
                    color: Colors.black87,
                    size: 25,
                  ),
                  const SizedBox(width: 8), // Add some space between the icon and text
                  Text(
                    'Restart Quiz!',
                    style: GoogleFonts.lato(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
