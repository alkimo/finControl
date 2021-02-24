import 'package:flutter/material.dart';

class ValueInput extends StatefulWidget {
  @override
  _ValueInputState createState() => _ValueInputState();
}

class _ValueInputState extends State<ValueInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 55, color: Colors.white),
      keyboardType: TextInputType.number,
      // inputFormatters: [totalAmount],
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 55,
          fontFamily: 'Ubuntu',
        ),
        hintText: '0.0',
      ),
    );
  }
}
