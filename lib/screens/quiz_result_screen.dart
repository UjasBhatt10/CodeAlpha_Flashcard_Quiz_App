// quiz_result_screen.dart
import 'package:flutter/material.dart';
import 'package:flashcard_quiz_app/app_theme.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  QuizResultScreen({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Quiz Result', style: AppTheme.appBarTextStyle),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Completed!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'You scored:',
                style: AppTheme.quizQuestionTextStyle
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '$score / $totalQuestions',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppTheme.primaryColor,
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Back to Home', style: AppTheme.buttonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
