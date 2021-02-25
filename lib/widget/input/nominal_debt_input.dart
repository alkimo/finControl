import 'package:flutter/material.dart';

class NominalDebtInput extends StatefulWidget {
  final TextEditingController nominalDebtController;
  double fontsize;

  NominalDebtInput(this.nominalDebtController, this.fontsize);

  @override
  _NominalDebtInputState createState() => _NominalDebtInputState();
}

class _NominalDebtInputState extends State<NominalDebtInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.nominalDebtController,
          style: TextStyle(
              fontSize: widget.fontsize,
              color: Colors.white,
              fontFamily: 'Ubuntu'
          ),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 55,
              fontFamily: 'Ubuntu',
            ),
            hintText: "0",
          ),
        ),
      ],
    );
  }
}
