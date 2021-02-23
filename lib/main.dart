import 'package:flutter/material.dart';
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

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Financial",
            style: TextStyle(color: Colors.white, fontSize: 90, fontFamily: 'Ubuntu'),
          ),
          Text(
            "Control",
            style: TextStyle(color: Colors.white, fontSize: 65, fontFamily: 'Ubuntu'),
          ),
          SizedBox(
            height: 65,
          ),


        ],
      ),
    );
  }
}
