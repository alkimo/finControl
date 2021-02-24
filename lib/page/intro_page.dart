import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../constants/sizes.dart';
import '../widget/button/bottom_buttom.dart';
import '../widget/input/nominal_debt_input.dart';
import '../widget/input/value_input.dart';
import '../widget/intro_page_container.dart';
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
  int nominalDebt;

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
                  NominalDebtInput(nominalDebtController),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            if (nominalDebtController.text != null &&
                nominalDebtController.text != "0" &&
                nominalDebtController.text != "" &&
                keyBoardIsVisible == false)
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: int.parse(nominalDebtController.text),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
                      child: Card(
                        color: Colors.red,
                        elevation: 5,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$index"),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            if (keyBoardIsVisible == false) BottomButton(),
          ],
        ),
      ),
    );
  }

  void invertTextSizes(isKeyBoardOpen) {
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
}
