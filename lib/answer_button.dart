import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.answerText,
    this.onTap, {
    super.key,
  });
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
              foregroundColor: const Color.fromARGB(255, 79, 99, 80),
              backgroundColor: const Color.fromARGB(255, 87, 82, 82),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          child: Text(answerText,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.white))),
    );
  }
}
