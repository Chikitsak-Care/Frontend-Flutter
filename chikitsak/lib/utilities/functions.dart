import 'package:chikitsak/screens/Landing%20Page/landingPage.dart';
import 'package:chikitsak/screens/UserAuthentication/UserLoginScreen/loginScreen.dart';
import 'package:chikitsak/screens/UserAuthentication/UserRegistrationProcess/helpUstoGetToKnowYou.dart';
import 'package:chikitsak/screens/UserAuthentication/UserRegistrationProcess/signUpScreen.dart';
import 'package:chikitsak/screens/onBoarding/onBoarding.dart';
import 'package:chikitsak/utilities/pageTransitions.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Future<void> getStarted(
    BuildContext context,
    String age,
    int gender,
    String weight,
    String height,
    String medications,
    String allergies,
    String uid) async {
  Navigator.pushReplacement(
    context,
    EnterExitRoute(
      exitPage: LoginScreen(),
      enterPage: LandingHome(
        uid: uid,
      ),
    ),
  );
}

Future<void> signOut(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final _auth = FirebaseAuth.instance;
  try {
    _auth.signOut();
    prefs.remove('uid');
    login(context);
  } catch (e) {
    Flushbar(
      message: e.message,
      duration: Duration(milliseconds: 2000),
    )..show(context);
  }
}

Future<void> signUp(BuildContext context, String email, String password,
    String name, String mobile) async {
  final _auth = FirebaseAuth.instance;
  User _user;
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .whenComplete(() => {_user = _auth.currentUser});
    if (_user != null) {
      prefs.setString("uid", _auth.currentUser.uid);
      Navigator.pushReplacement(
        context,
        EnterExitRoute(
          exitPage: LoginScreen(),
          enterPage: HelpUsKnowYouBetter(
              name: name, mobile: mobile, uid: _auth.currentUser.uid),
        ),
      );
    }
  } catch (e) {
    Flushbar(
      message: e.message.toString(),
      duration: Duration(milliseconds: 2000),
    )..show(context);
  }
}

Future<void> signin(BuildContext context, String email, String password) async {
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

    final _auth = FirebaseAuth.instance;
    User _user;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => {_user = _auth.currentUser});
      if (_user != null) {
        prefs.setString("uid", _auth.currentUser.uid);
        Navigator.pushReplacement(
          context,
          EnterExitRoute(
            exitPage: LoginScreen(),
            enterPage: LandingHome(
              uid: _user.uid,
            ),
          ),
        );
      }
    } catch (e) {
      Flushbar(
        message: e.message,
        duration: Duration(milliseconds: 2000),
      )..show(context);
    }
  }
}
