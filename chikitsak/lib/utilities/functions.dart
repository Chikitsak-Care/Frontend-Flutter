import 'package:chikitsak/screens/DashBoard/dashBoard.dart';
import 'package:chikitsak/screens/UserAuthentication/UserLoginScreen/loginScreen.dart';
import 'package:chikitsak/screens/UserAuthentication/UserRegistrationProcess/signUpScreen.dart';
import 'package:chikitsak/screens/onBoarding/onBoarding.dart';
import 'package:chikitsak/utilities/pageTransitions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

void login(BuildContext context) {
  Navigator.pushReplacement(
    context,
    EnterExitRoute(
      enterPage: LoginScreen(),
      exitPage: Home(),
    ),
  );
}

void signup(BuildContext context) {
  Navigator.pushReplacement(
    context,
    EnterExitRoute(
      exitPage: Home(),
      enterPage: SignUpScreen(),
    ),
  );
}

void signin(BuildContext context, String email, String password) {
  if (!EmailValidator.validate(email)) {
    Flushbar(
      message: "Invalid Email Address",
      duration: Duration(milliseconds: 2000),
    )..show(context);
  } else {
    Flushbar(
      message: "Logging in $email",
      duration: Duration(milliseconds: 2000),
    )..show(context);

    //api call which will give uid as response

    //mock uid
    String uid = "mock_user_identification_001_test";

    Navigator.pushReplacement(
      context,
      EnterExitRoute(
        exitPage: LoginScreen(),
        enterPage: DashBoard(
          uid: uid,
        ),
      ),
    );
  }
}
