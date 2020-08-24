import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/functions.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height(context, 70),
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
    );
  }
}