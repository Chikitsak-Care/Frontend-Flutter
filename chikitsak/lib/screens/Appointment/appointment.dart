import 'package:chikitsak/utilities/constants.dart';
import 'package:chikitsak/utilities/relativeSizing.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  Appointment({this.uid});
  final String uid;
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    List<Widget> doctors = [
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
      _topDoctorTile("General Physician", "Vivek Singh", "99%"),
      _topDoctorTile("Paediatrician", "Anand Sharma", "98%"),
      _topDoctorTile("Dentist", "Kiran Deep", "96%"),
    ];

    return Scaffold(
      backgroundColor: uiBlue,
      appBar: AppBar(
        backgroundColor: Color(0xFFDFDFDF),
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: uiBlue),
        title: Text("Find Doctors",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: height(context, 20))),
      ),
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDFDFDF),
            child: Padding(
              padding: EdgeInsets.all(height(context, 14)),
              child: Column(
                children: [
                  _searchBar(),
                  _filter(),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(children: doctors),
                      ),
                    ),
                  )
                ],
              ),
            ),),
      ),
    );
  }

  Widget _filter() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height(context, 26)),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sort_outlined, color: uiBlue, size: height(context, 20)),
            SizedBox(width: width(context, 2)),
            Text(
              "Filter",
              style: TextStyle(
                  fontSize: height(context, 18),
                  fontWeight: FontWeight.w500,
                  color: uiBlue),
            )
          ],
        ),
      ),
    );
  }

  Widget _topDoctorTile(
      String doctorCategory, String doctorName, String responseRate) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height(context, 3),
      ),
      child: Container(
        height: height(context, 68),
        width: width(context, 340),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              height(context, 10),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height(context, 11),
            horizontal: width(context, 15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height(context, 46),
                width: width(context, 48),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.all(Radius.circular(height(context, 10)))),
              ),
              Padding(
                padding: EdgeInsets.only(left: width(context, 14.0)),
                child: Container(
                  width: width(context, 180),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        doctorCategory,
                        style: TextStyle(
                            fontSize: height(context, 12),
                            color: Colors.grey[400]),
                      ),
                      SizedBox(height: height(context, 3)),
                      Text(
                        "Dr. " + doctorName,
                        style: TextStyle(
                            fontSize: height(context, 14),
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800]),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    responseRate,
                    style: TextStyle(
                      fontSize: height(context, 16),
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF27AE60),
                    ),
                  ),
                  Text(
                    "response rate",
                    style: TextStyle(
                        fontSize: height(context, 9), color: Colors.grey[500]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    void _onPressed() {}
    String searchString = "";
    return Container(
      width: width(context, 338),
      height: height(context, 50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            height(context, 10),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width(context, 290),
            height: height(context, 46),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  contentPadding: EdgeInsets.only(
                    left: width(context, 16),
                  ),
                  hintText: "Search by doctor name",
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
          ),
          // SizedBox(width: width(context, 20)),
          GestureDetector(
            onTap: () => _onPressed(),
            child: Container(
              width: width(context, 46),
              height: height(context, 46),
              decoration: BoxDecoration(
                color: uiBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    height(context, 10),
                  ),
                ),
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: width(context, 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
