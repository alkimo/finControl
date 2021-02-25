import 'package:flutter/material.dart';

class DeadlinedDebtInput extends StatelessWidget {
  final int nominalDebt;

  DeadlinedDebtInput(this.nominalDebt);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
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
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.white,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          height: 40,
                          width: 115,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            keyboardType:
                            TextInputType.datetime,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              hintText: "0.0",
                              border:
                              const OutlineInputBorder(),
                              hintStyle: TextStyle(
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            height: 40,
                            width: 115,
                            child: TextField(
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              keyboardType:
                              TextInputType.datetime,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: "dd/mm/aaaa",
                                border:
                                const OutlineInputBorder(),
                                hintStyle: TextStyle(
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
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
