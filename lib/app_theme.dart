import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Colors.blue.shade400;
  static final Color secondaryColor = Colors.blue.shade900;

  static final TextStyle appBarTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle quizQuestionTextStyle = TextStyle(
    fontSize: 22,
    color: Colors.black87,
  );

  static final TextStyle flashcardTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  static final TextStyle flashcardQuestionTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle flashcardAnswerTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  static final BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [primaryColor, secondaryColor],
    ),
  );
}
