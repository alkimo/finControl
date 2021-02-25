import 'package:flutter/material.dart';

class DeadlinedDebtInput extends StatelessWidget {
  final int nominalDebt;

  DeadlinedDebtInput(this.nominalDebt);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nominalDebt,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: Card(
              color: Colors.red,
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
