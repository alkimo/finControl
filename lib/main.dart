import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexagon/hexagon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final TextEditingController _untimedDebt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _untimedDebt.text = "";
    _untimedDebt.addListener(_inputValue);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFF0e406f), Color(0xFF05173e)])),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55.0),
                child: Text(
                  "Financial",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Control",
                  style: TextStyle(
                      color: Colors.white, fontSize: 50, fontFamily: 'Ubuntu'),
                ),
              ),
              Text(
                "Whats your montly income?",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Ubuntu',
                  color: Color(0xFF0e406f),
                ),
              ),
              TextField(
                style: TextStyle(fontSize: 55, color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white, fontSize: 55),
                  hintText: '0.0',
                ),
              ),
              Text(
                "Your total nontime limit debt?",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Ubuntu',
                  color: Color(0xFF0e406f),
                ),
              ),
              TextField(
                style: TextStyle(fontSize: 55, color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0.0',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 55),
                ),
              ),
              Text(
                "Amount of deadlined debts?",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Ubuntu',
                  color: Color(0xFF0e406f),
                ),
              ),
              TextField(
                onChanged: _inputValue(),
                controller: _untimedDebt,
                style: TextStyle(fontSize: 55, color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.white, fontSize: 55),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: HexagonWidget.pointy(
                      cornerRadius: 15,
                      width: 100,
                      color: Colors.white,
                      elevation: 5,
                      child: Text(
                        '\$',
                        style: TextStyle(fontSize: 55),
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
  }

  _inputValue() {
    if (_untimedDebt.text != "") {
      print("Debt Value: ${_untimedDebt.text}");
    }
  }
}
