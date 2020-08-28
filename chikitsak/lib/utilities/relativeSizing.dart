import 'package:flutter/material.dart';

double height(BuildContext context, int x) {
  double viewPort = MediaQuery.of(context).size.height;
  double ratio = 812 / x;
  return viewPort / ratio;
}

double width(BuildContext context, int y) {
  double viewPort = MediaQuery.of(context).size.width;
  double ratio = 375 / y;
  return viewPort / ratio;
}
