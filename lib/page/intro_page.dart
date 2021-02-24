import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../constants/sizes.dart';
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
  bool keyBoardIsVisible = false;
  double titleSize = Sizes.titleBigSize;
  double subTitleSize = Sizes.subTitleBigSize;
  double questionSize = Sizes.questionBigSize;

  @override
  void initState() {
    super.initState();

    keyBoardController.onChange.listen((visible) {
      setState(() {
        invertTextSizes(visible);
        keyBoardIsVisible = visible;
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
                  MyTitle("Financial", titleSize),
                  MySubTitle("Control", subTitleSize),
                  Question("Whats your monthly income?", questionSize),
                  ValueInput(),
                  Question("Your total nontimed debt?", questionSize),
                  ValueInput(),
                  Question("Amount of deadlined debts?", questionSize),
                  ValueInput(),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            if (keyBoardIsVisible == false) 
              BottomButton(),
          ],
        ),
      ),
    );
  }
  
  void invertTextSizes(bool isKeyBoardOpen){
    if(isKeyBoardOpen){
      titleSize = Sizes.titleSmallSize;
      subTitleSize = Sizes.subTitleSmallSize;
      questionSize = Sizes.questionSmallSize;
    } else {
      titleSize = Sizes.titleBigSize;
      subTitleSize = Sizes.subTitleBigSize;
      questionSize = Sizes.questionBigSize;
    }
  }
}
