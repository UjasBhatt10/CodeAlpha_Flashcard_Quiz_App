// main.dart
import 'package:flutter/material.dart';
import 'package:flashcard_quiz_app/screens/flashcard_screen.dart';
import 'package:flashcard_quiz_app/screens/quiz_screen.dart';
import 'package:flashcard_quiz_app/screens/quiz_result_screen.dart';
import 'package:flashcard_quiz_app/models/flashcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FlashcardScreen(),
        '/quiz': (context) => QuizScreen(
            flashcards:
                ModalRoute.of(context)?.settings.arguments as List<Flashcard>),
        '/quiz_result': (context) {
          final Map<String, dynamic>? args = ModalRoute.of(context)
              ?.settings
              .arguments as Map<String, dynamic>?;
          final int score =
              args?['score'] ?? 0; // Default to 0 if score is not provided
          final int totalQuestions = args?['totalQuestions'] ??
              0; // Default to 0 if totalQuestions is not provided
          return QuizResultScreen(score: score, totalQuestions: totalQuestions);
        },
      },
    );
  }
}
