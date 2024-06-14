// quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:flashcard_quiz_app/models/flashcard.dart';
import 'package:flashcard_quiz_app/app_theme.dart';

class QuizScreen extends StatefulWidget {
  final List<Flashcard> flashcards;

  QuizScreen({required this.flashcards});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentCardIndex = 0;
  int score = 0;

  void showNextCard() {
    setState(() {
      if (currentCardIndex < widget.flashcards.length - 1) {
        currentCardIndex++;
      } else {
        // If all questions are answered, navigate to QuizResultScreen
        Navigator.pushReplacementNamed(
          context,
          '/quiz_result',
          arguments: {
            'score': score,
            'totalQuestions': widget.flashcards.length,
          },
        );
      }
    });
  }

  void handleCorrectAnswer() {
    setState(() {
      score++;
      showNextCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Quiz', style: AppTheme.appBarTextStyle),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Question ${currentCardIndex + 1}/${widget.flashcards.length}',
                style: AppTheme.quizQuestionTextStyle,
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                color: Colors.blueAccent, // Flashcard background color
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        widget.flashcards[currentCardIndex].question,
                        style: AppTheme.flashcardTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.blueAccent,
                                title: Text('Answer'),
                                content: Text(
                                    widget.flashcards[currentCardIndex].answer),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      handleCorrectAnswer();
                                    },
                                    child: Text('Correct',
                                        style: AppTheme.buttonTextStyle),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppTheme.primaryColor,
                        ),
                        child: Text('Reveal Answer',
                            style: AppTheme.buttonTextStyle),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showNextCard();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppTheme.secondaryColor,
                ),
                child: Text(
                  currentCardIndex < widget.flashcards.length - 1
                      ? 'Next Question'
                      : 'Finish Quiz',
                  style: AppTheme.buttonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
