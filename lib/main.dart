import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexagon/hexagon.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

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
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final TextEditingController _untimedDebt = TextEditingController();

  final keyboardVisibilityController = KeyboardVisibilityController();
  final double _titleBigSize = 80;
  final double _titleSmallSize = 50;
  final double _questionBigSize = 25;
  final double _questionSmallSize = 15;
  final double _subTitleBigSize = 50;
  final double _subTitleSmallSize = 30;
  bool _openKeyboard = false;
  double _titleSize;
  double _subTitleSize;
  double _questionSize;
  var _lastTotalDeadlinedDebt;
  var _currentTotalDeadlinedDebt;

  @override
  void initState() {
    super.initState();
    _titleSize = _titleBigSize;
    _subTitleSize = _subTitleBigSize;
    _questionSize = _questionBigSize;

    keyboardVisibilityController.onChange.listen((visible) {
      setState(() {
        if (visible) {
          _titleSize = _titleSmallSize;
          _subTitleSize = _subTitleSmallSize;
          _questionSize = _questionSmallSize;
        } else {
          _titleSize = _titleBigSize;
          _subTitleSize = _subTitleBigSize;
          _questionSize = _questionBigSize;
        }
        _openKeyboard = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    fontSize: _titleSize,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  "Control",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: _subTitleSize,
                      fontFamily: 'Ubuntu'),
                ),
              ),
              Text(
                "Whats your montly income?",
                style: TextStyle(
                  fontSize: _questionSize,
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
                "Your total nontimed debt?",
                style: TextStyle(
                  fontSize: _questionSize,
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
                  fontSize: _questionSize,
                  fontFamily: 'Ubuntu',
                  color: Color(0xFF0e406f),
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: _inputValue(),
                  controller: _untimedDebt,
                  style: TextStyle(
                      fontSize: (_currentTotalDeadlinedDebt != 0 &&
                              _currentTotalDeadlinedDebt != null)
                          ? 25
                          : 55,
                      color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '0',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 55),
                  ),
                ),
              ),
              if (_currentTotalDeadlinedDebt != 0 &&
                  _currentTotalDeadlinedDebt != null)
                Container(
                  height: 50,
                  width: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: int.parse(_currentTotalDeadlinedDebt),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 300,
                        color: Color(0xFF0e406f),
                        child: Row(
                          children: [
                            Expanded(
                              child: Icon(
                                Icons.attach_money,
                                color: Colors.white,
                              ),
                            ),
                            
                            Expanded(
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              Expanded(
                child: Container(),
              ),
              if (_openKeyboard == false)
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
    if (_untimedDebt.text != _lastTotalDeadlinedDebt &&
        _untimedDebt.text != "" &&
        _untimedDebt.text != null) {
      print(_untimedDebt.text);
      setState(() {
        _currentTotalDeadlinedDebt = _untimedDebt.text;
      });
    }
    _lastTotalDeadlinedDebt = _untimedDebt.text;
  }
}
