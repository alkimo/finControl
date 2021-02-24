import 'package:flutter/material.dart';

class MyTitle extends StatefulWidget {
  final String text;
  final double textSize;

  MyTitle(this.text, this.textSize);

  @override
  _MyTitleState createState() => _MyTitleState();
}

class _MyTitleState extends State<MyTitle> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55.0),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: widget.textSize,
          fontFamily: 'Ubuntu',
        ),
      ),
    );
  }
}
