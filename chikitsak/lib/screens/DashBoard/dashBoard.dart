import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  DashBoard({@required this.uid});
  final String uid;
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: uiBlue,
      body: SafeArea(
        child: _buildDashboardBody(),
      ),
    );
  }

  Widget _buildDashboardBody() {
    return Column(
      children: [
        _topAppBar(),
        _bannerUser(),
        _homeScreenBody(),
      ],
    );
  }

  Widget _topAppBar() {
    return Padding(
      padding: EdgeInsets.only(
        left: width(context, 22),
        top: height(context, 32),
        right: width(context, 22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _sideNavigationButton(),
          _notificationIconButton(),
        ],
      ),
    );
  }

  Widget _bannerUser() {
    String name = "Tester";
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width(context, 48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/Doctors-pana 1.png',
            height: height(context, 111),
            width: width(context, 72),
          ),
          SizedBox(
            width: width(context, 17),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi $name!",
                  style: TextStyle(
                      fontSize: height(context, 20),
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height(context, 7),
                ),
                Text(
                  "Book Your appointment with",
                  style: TextStyle(
                    fontSize: height(context, 14),
                    color: Colors.white,
                  ),
                ),
                Text(
                  "the right doctor",
                  style: TextStyle(
                    fontSize: height(context, 14),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _homeScreenBody() {
    List<Widget> _homeScreenWidgets = [_searchBar(), _covidBanner()];

    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: uiGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                height(context, 30),
              ),
              topLeft: Radius.circular(
                height(context, 30),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: height(context, 18),
              left: width(context, 28),
              right: width(context, 28),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _homeScreenWidgets,
              ),
            ),
          )),
    );
  }

  Widget _covidBanner() {
    return Padding(
      padding: EdgeInsets.only(
        top: height(context, 15),
      ),
      child: Container(
        height: height(context, 90),
        width: width(context, 331),
        child: Image.asset(
          'assets/BG.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _searchBar() {
    void _onPressed() {}
    String searchString = "";
    return Container(
      width: width(context, 314),
      height: height(context, 44),
      decoration: BoxDecoration(
        color: Color(0xFFDFDFDF),
        borderRadius: BorderRadius.all(
          Radius.circular(
            height(context, 10),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width(context, 234),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: width(context, 16),
                ),
                hintText: "Search Doctors, medicines...",
                border: InputBorder.none,
              ),
              onChanged: (value) {
                searchString = value;
              },
              onSubmitted: (value) {
                print(searchString);
              },
            ),
          ),
          GestureDetector(
            onTap: () => _onPressed(),
            child: Container(
              width: width(context, 55),
              height: height(context, 44),
              decoration: BoxDecoration(
                color: uiRed,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    height(context, 10),
                  ),
                ),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: width(context, 22),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _sideNavigationButton() {
    void _onTap() {}

    return GestureDetector(
      onTap: () => _onTap(),
      child: Image.asset(
        'assets/Vector.png',
        height: height(context, 18.67),
        width: width(context, 22),
      ),
    );
  }

  Widget _notificationIconButton() {
    void _onPressed() {}
    return GestureDetector(
      child: Icon(
        Icons.notifications,
        color: Colors.white,
        size: width(context, 22),
      ),
      onTap: () => _onPressed(),
    );
  }
}
