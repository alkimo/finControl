import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.redAccent,
      width: double.infinity,
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, '/charts'),
        child: Center(
          child: Text(
            "Generate Charts",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
      ),
    );
  }
}
