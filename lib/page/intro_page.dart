import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../widget/bottom_buttom.dart';
import '../widget/intro_page_container.dart';
import '../widget/questions.dart';
import '../widget/subtitle.dart';
import '../widget/title.dart';
import '../widget/value_input.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final keyBoardController = KeyboardVisibilityController();
  bool _keyBoardIsOpen;

  @override
  void initState() {
    super.initState();

    keyBoardController.onChange.listen((visible) {
      setState(() {
        _keyBoardIsOpen = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IntroPageContainer(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTitle("Financial"),
                  MySubTitle("Control"),
                  Question("Whats your monthly income?"),
                  ValueInput(),
                  Question("Your total nontimed debt?"),
                  ValueInput(),
                  Question("Amount of deadlined debts?"),
                  ValueInput(),
                ],
              ),
            ),

            Expanded(
              child: Container(),
            ),
            if (_keyBoardIsOpen == false)
              BottomButton(),
          ],
        ),
      ),
    );
  }
}
