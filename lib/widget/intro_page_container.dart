import 'package:flutter/material.dart';

class IntroPageContainer extends StatefulWidget {
  Widget introPageChild;

  IntroPageContainer(this.introPageChild);

  @override
  _IntroPageContainerState createState() => _IntroPageContainerState();
}

class _IntroPageContainerState extends State<IntroPageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFF0e406f), Color(0xFF05173e)],
        ),
      ),
      child: widget.introPageChild,
    );
  }
}
