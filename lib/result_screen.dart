import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key, required this.resultLlst, required this.reStartFunc});
  final void Function() reStartFunc;
  final List<String> resultLlst;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < resultLlst.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': resultLlst[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    //where is a method that take only true data and make a list of true data
    final correctQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You Answered $correctQuestions out of $totalQuestions questions correctly!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summaryData),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton.icon(
                onPressed: reStartFunc,
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green),
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Reset',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
