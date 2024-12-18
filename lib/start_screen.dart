import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.swichScreen, {super.key});
  // final means it will used one time and void is not going to return anything
  //  and Function() means swichScreen is a function and it has no argument.
  final void Function() swichScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            color: const Color.fromARGB(139, 76, 175, 79),
          ),
          // this way is not proper way try to avoid it as much as possible
          // Opacity(opacity: 0.2,
          // child: Image.asset('assets/images/quiz-logo.png',height: 300,)),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Start your Quiz improve your skill',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: swichScreen,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('START QUIZ'))
        ],
      ),
    );
  }
}
