import 'package:chikitsak/screens/DashBoard/dashBoard.dart';
import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/functions.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class LandingHome extends StatefulWidget {
  LandingHome({this.uid});
  final String uid;
  @override
  _LandingHomeState createState() => _LandingHomeState();
}

class _LandingHomeState extends State<LandingHome> {
  DashBoardTab currentDashBoardTab;

  @override
  void initState() {
    currentDashBoardTab = DashBoardTab.home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uiBlue,
      extendBody: true,
      body: DashBoard(uid: widget.uid),
      bottomNavigationBar: FloatingNavbar(
        borderRadius: height(context, 20),
        margin: EdgeInsets.symmetric(
            horizontal: width(context, 14), vertical: height(context, 14)),
        iconSize: height(context, 32),
        fontSize: height(context, 12),
        backgroundColor: Color(0xFF00B6BD),
        selectedBackgroundColor: Colors.white,
        selectedItemColor: uiBlue,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.assignment, title: 'Reports'),
          FloatingNavbarItem(icon: Icons.forum, title: 'Chat'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        ],
        currentIndex: currentDashBoardTab.index,
        onTap: (int val) {
          switch (val) {
            case 0:
              this.setState(() {
                currentDashBoardTab = DashBoardTab.home;
              });
              break;
            case 1:
              this.setState(() {
                currentDashBoardTab = DashBoardTab.report;
              });
              break;
            case 2:
              this.setState(() {
                currentDashBoardTab = DashBoardTab.chat;
              });
              break;
            case 3:
              this.setState(() {
                currentDashBoardTab = DashBoardTab.profile;
              });
              signOut(context);
              break;
          }
        },
      ),
    );
  }
}

enum DashBoardTab { home, report, chat, profile }
