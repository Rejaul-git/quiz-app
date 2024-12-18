import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  // answer is a argument of onSelectAnswer implemented this way
  // onselectAnswer function ti akti kore answer nibe abong ta pathiye dibe
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

//onSelectAnswer is a QuestionScreen class method but we need to access inside the _QuestionScreenState class
// for that there is a fuild in property colled (Wedget) like: widget.onSelectAnswer line 24
class _QuestionScreenState extends State<QuestionScreen> {
  var changeIndex = 0;

  void answerQuestion(String seletedAnswer) {
    widget.onSelectAnswer(seletedAnswer);
    setState(() {
      changeIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[changeIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
            // mainAxisAlignment varticaly(upor theke niche) alignment korethake like center,spaceBetween,
            // crossAxisAlignment  horzontaly(pasapasi) stretch take all the available  width space for the text button
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 243, 243, 243),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              // children is a list so we can not use second list inside of list that is why we are use spread operator before the list item
              //
              ...currentQuestion.getShuffledLIst().map((item) {
                return AnswerButton(item, () {
                  answerQuestion(item);
                });
              }),
            ]),
      ),
    );
  }
}
