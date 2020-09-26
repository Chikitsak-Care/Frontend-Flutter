import 'package:chikitsak/utilities/functions.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final String uid;

  ProfileTab({this.uid});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            signOut(context);
          },
          child: Container(
            height: 50,
            width: 100,
            child: Center(
              child: Text("Logout"),
            ),
          ),
        )
      ],
    );
  }
}
