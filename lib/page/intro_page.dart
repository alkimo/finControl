import 'package:flutter/material.dart';

import '../widget/intro_page_container.dart';
import '../widget/subtitle.dart';
import '../widget/title.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IntroPageContainer(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTitle("Financial"),
            MySubTitle("Control"),
          ],
        ),
      ),
    );
  }
}
