import 'package:chikitsak/utilities/functions.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:chikitsak/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    TextStyle kLoginHeader = baseStyle.copyWith(
        color: uiBlue,
        fontSize: height(context, 14),
        fontWeight: FontWeight.w600);
    TextStyle kHeader = baseStyle.copyWith(
        color: Colors.black,
        fontSize: height(context, 26),
        fontWeight: FontWeight.bold);
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
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(context, 30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height(context, 150),
                  child: Image.asset("assets/login.png"),
                ),
                SizedBox(
                  height: height(context, 25),
                ),
                Text(
                  "Welcome Back",
                  style: kLoginHeader,
                ),
                SizedBox(
                  height: height(context, 10),
                ),
                Text(
                  "Login with Email",
                  style: kHeader,
                ),
                SizedBox(
                  height: height(context, 25),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: width(context, 20),
                      ),
                      labelText: "Email",
                      hintText: "example@gmail.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        width(context, 16),
                      ))),
                ),
                SizedBox(
                  height: height(context, 20),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "",
                    contentPadding: EdgeInsets.only(
                      left: width(context, 20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        width(context, 16),
                      ),
                    ),
                    suffixIcon: IconButton(
                        iconSize: height(context, 20),
                        color: uiBlue,
                        icon: _isHidden
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: _toggleVisibility),
                  ),
                ),
                SizedBox(
                  height: height(context, 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password    ",
                      style: kSubBody.copyWith(
                        fontSize: height(context, 13),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height(context, 25),
                ),
                MaterialButton(
                  height: height(context, 50),
                  minWidth: width(context, 200),
                  onPressed: () {
                    if (email != null && password != null)
                      signin(context, email, password);
                    else
                      Flushbar(
                        message: "Invalid Email / Password",
                        duration: Duration(milliseconds: 3000),
                      )..show(context);
                  },
                  child: Text(
                    "Login",
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
                      "Don't have an Account?",
                      style: kSubBody,
                    ),
                    GestureDetector(
                        onTap: () => signup(context),
                        child: Text(" Create Now", style: kSubBody2))
                  ],
                ),
                SizedBox(
                  height: height(context, 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
