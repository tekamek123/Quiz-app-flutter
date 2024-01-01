
class QuizQuestions {
  final String question;
  //final String answer;
  final List<String> options;
  QuizQuestions({
    required this.question,
    //required this.answer,
    required this.options,
  });

  List<String> getShuffledOptions() {
   final shuffledList =  List.of(options);
   shuffledList.shuffle();
   return shuffledList;
  }
}