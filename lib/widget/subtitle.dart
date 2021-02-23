import 'package:flutter/material.dart';

class MySubTitle extends StatefulWidget {
  final String text;

  MySubTitle(this.text);

  @override
  _MySubTitleState createState() => _MySubTitleState();
}

class _MySubTitleState extends State<MySubTitle> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontFamily: 'Ubuntu',
        ),
      ),
    );
  }
}
