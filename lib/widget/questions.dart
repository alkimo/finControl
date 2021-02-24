import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;

  Question(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: 25,
        fontFamily: 'Ubuntu',
        color: Color(0xFF0e406f),
      ),
    );
  }
}
