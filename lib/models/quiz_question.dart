class QuizQuestions {
  const QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledLIst() {
    // List is a Dirt build in class and it has a (of) constractor function that give a copy list of (answers)
    // final does not work when reassign variable
    final shuffledList = List.of(answers);
    // shuffle is a function that changle the list order.
    shuffledList.shuffle();
    return shuffledList;
  }
}
