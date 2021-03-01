import 'package:fin_control/constants/sizes.dart';
import 'package:fin_control/widget/intro_page_container.dart';
import 'package:fin_control/widget/text/subtitle.dart';
import 'package:fin_control/widget/text/title.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widget/charts/line_chart.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  double titleSize = Sizes.titleBigSize;
  double subTitleSize = Sizes.subTitleBigSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroPageContainer(
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LineChartSample2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
