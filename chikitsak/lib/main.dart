import 'package:chikitsak/screens/onBoarding/onBoarding.dart';
import 'package:chikitsak/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chikitsak",
      theme: ThemeData(primaryColor: uiBlue),
      home: Home(),
    );
  }
}
