import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../constants/sizes.dart';
import '../widget/button/bottom_buttom.dart';
import '../widget/input/deadlined_debt_input.dart';
import '../widget/input/nominal_debt_input.dart';
import '../widget/input/value_input.dart';
import '../widget/intro_page_container.dart';
import '../widget/size_filler.dart';
import '../widget/text/questions.dart';
import '../widget/text/subtitle.dart';
import '../widget/text/title.dart';


class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final keyBoardController = KeyboardVisibilityController();
  final nominalDebtController = TextEditingController();

  bool keyBoardIsVisible = false;

  double titleSize = Sizes.titleBigSize;
  double subTitleSize = Sizes.subTitleBigSize;
  double questionSize = Sizes.questionBigSize;
  double nominalDebtTextSize = Sizes.nominalDebtBigTextSize;

  int nominalDebt = 0;

  @override
  void initState() {
    super.initState();

    nominalDebtController.addListener(() {
      setState(() {
        nominalDebt = int.parse(nominalDebtController.text);
      });
    });

    keyBoardController.onChange.listen((visible) {
      setState(() {
        invertTextSizes(isKeyBoardOpen: visible);
        keyBoardIsVisible = visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Question("Monthly income?", questionSize),
                  ValueInput(),
                  Question("Total debt without deadline?", questionSize),
                  ValueInput(),
                  Question("Nominal amount of deadlined debt?", questionSize),
                  NominalDebtInput(nominalDebtController, nominalDebtTextSize),
                ],
              ),
            ),
            SizeFiller(),
            if (isNominalDebtValid(nominalDebt))
              DeadlinedDebtInput(nominalDebt),

            if (!keyBoardIsVisible)
              BottomButton(),
          ],
        ),
      ),
    );
  }

  void invertTextSizes({@required bool isKeyBoardOpen}) {
    if (isKeyBoardOpen) {
      titleSize = Sizes.titleSmallSize;
      subTitleSize = Sizes.subTitleSmallSize;
      questionSize = Sizes.questionSmallSize;
    } else {
      titleSize = Sizes.titleBigSize;
      subTitleSize = Sizes.subTitleBigSize;
      questionSize = Sizes.questionBigSize;
    }
  }

  bool isNominalDebtValid(int nominalDebtValue) {
    print(nominalDebtValue);
    if (nominalDebtValue != null &&
        nominalDebtValue != "0" &&
        nominalDebtValue != "" &&
        nominalDebtValue != 0) {
      return true;
    } else {
      return false;
    }
  }
}



