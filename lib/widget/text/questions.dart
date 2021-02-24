import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;
  final double textSize;

  Question(this.text, this.textSize);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: 'Ubuntu',
        color: Color(0xFF0e406f),
      ),
    );
  }
}
