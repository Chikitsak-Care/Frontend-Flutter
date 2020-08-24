import 'package:flutter/material.dart';

//UI Colors
const uiBlue = Color(0xFF0190b0);
const uiGrey = Color(0xFFC4C4C4);
const uiSkyBlue = Color(0xFF33B6FF);

//textStyles
const baseStyle = TextStyle(color: Colors.white, fontFamily: "Montserrat");
const baseStyleBlack = TextStyle(color: Colors.black, fontFamily: "Montserrat");

//onBoardingScreen
TextStyle kHeader = baseStyle.copyWith(
    color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold);
TextStyle kSubHeader = kHeader.copyWith(color: uiBlue);
TextStyle kBody = baseStyle.copyWith(fontSize: 16, color: Colors.black);
TextStyle kSubBody = baseStyle.copyWith(
    color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle kSubBody2 = kSubBody.copyWith(color: uiBlue);
TextStyle kButton1 =
    baseStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600);

//LoginScreen
TextStyle kLoginHeader = baseStyle.copyWith(
    color: uiBlue, fontSize: 14, fontWeight: FontWeight.w600);
