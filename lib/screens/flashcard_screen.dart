// flashcard_screen.dart
import 'package:flutter/material.dart';
import 'package:flashcard_quiz_app/models/flashcard.dart';
import 'package:flashcard_quiz_app/app_theme.dart';
import 'package:flashcard_quiz_app/screens/quiz_screen.dart';

class FlashcardScreen extends StatefulWidget {
  @override
  _FlashcardScreenState createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  List<Flashcard> flashcards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Flashcards', style: AppTheme.appBarTextStyle),
      ),
      body: Container(
        decoration: AppTheme.gradientBackground,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: questionController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Question',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: answerController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Answer',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (questionController.text.isNotEmpty &&
                    answerController.text.isNotEmpty) {
                  setState(() {
                    flashcards.add(Flashcard(
                      question: questionController.text,
                      answer: answerController.text,
                    ));
                    questionController.clear();
                    answerController.clear();
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppTheme.primaryColor,
              ),
              child: Text('Add Flashcard', style: AppTheme.buttonTextStyle),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (flashcards.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    '/quiz',
                    arguments: flashcards,
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('No Flashcards'),
                        content:
                            Text('Please add flashcards to start the quiz.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppTheme.secondaryColor,
              ),
              child: Text('Start Quiz', style: AppTheme.buttonTextStyle),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: flashcards.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue.shade400, // Flashcard background color
                    child: ListTile(
                      title: Text(
                        flashcards[index].question,
                        style: AppTheme.flashcardQuestionTextStyle,
                      ),
                      subtitle: Text(
                        flashcards[index].answer,
                        style: AppTheme.flashcardAnswerTextStyle,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
