import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/functions.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextStyle kHeader = baseStyle.copyWith(
        color: Colors.black,
        fontSize: height(context, 26),
        fontWeight: FontWeight.bold);
    TextStyle kSubHeader = kHeader.copyWith(color: uiBlue);
    TextStyle kBody =
        baseStyle.copyWith(fontSize: height(context, 16), color: Colors.black);
    TextStyle kSubBody = baseStyle.copyWith(
        color: Colors.black,
        fontSize: height(context, 16),
        fontWeight: FontWeight.w500);
    TextStyle kSubBody2 = kSubBody.copyWith(color: uiBlue);
    TextStyle kButton1 = baseStyle.copyWith(
        fontSize: height(context, 20), fontWeight: FontWeight.w600);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height(context, 25),
              ),
              SizedBox(
                height: height(context, 80),
                child: Image.asset(
                  "assets/chikitstakLogo.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: height(context, 25),
              ),
              Text(
                "Welcome to",
                style: kHeader,
              ),
              Text(
                "Chikitsak",
                style: kSubHeader,
              ),
              SizedBox(
                height: height(context, 15),
              ),
              Text(
                "Healthcare at your Fingertips",
                style: kBody,
              ),
              SizedBox(
                height: height(context, 50),
              ),
              Container(
                height: height(context, 300),
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/onBoarding.png"),
              ),
              SizedBox(
                height: height(context, 50),
              ),
              MaterialButton(
                height: height(context, 60),
                minWidth: width(context, 280),
                onPressed: () => signup(context),
                child: Text(
                  "Create Account",
                  style: kButton1,
                ),
                color: uiBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              SizedBox(
                height: height(context, 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account?",
                    style: kSubBody,
                  ),
                  GestureDetector(
                      onTap: () => login(context),
                      child: Text(" Sign In", style: kSubBody2))
                ],
              ),
              SizedBox(
                height: height(context, 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
