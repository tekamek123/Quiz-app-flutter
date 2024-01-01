import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {

final void Function() startQuiz;

  const StartScreen(void Function() switchScreen, {required this.startQuiz,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade400,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/quiz_logo.png',
              width: 500.0,
              height: 420.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 25,
            ),
             Text(
              'Learn About Ethiopia!',
              style: GoogleFonts.lato(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: const StadiumBorder(),
                side: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                )
              ),
              onPressed:  () {
                startQuiz();
                },
              icon:  const Icon( Icons.arrow_right_outlined,),
              label:  Text('Start Quiz', style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red.shade400,),
            )
            )
          ],
        ));
  }
}
