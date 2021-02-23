import 'package:flutter/material.dart';

class MyTitle extends StatefulWidget {
  final String text;

  MyTitle(this.text);

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
          fontSize: 80,
          fontFamily: 'Ubuntu',
        ),
      ),
    );
  }
}
