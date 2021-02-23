import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String text;

  Question(text);
  @override
  Widget build(BuildContext context) {
    Text(
      text,
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Ubuntu',
        color: Color(0xFF0e406f),
      ),
    );
  }
}
