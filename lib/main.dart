import 'package:fin_control/page/chart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page/intro_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => IntroPage(),
        '/charts': (context) => ChartPage(),
      },
      // home: TestPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

