//หน้าหลัก
// ignore_for_file: prefer_const_constructors

import 'package:cyc/utility/style.dart';
import 'package:flutter/material.dart';

class showlistdata extends StatefulWidget {
  const showlistdata({Key? key}) : super(key: key);

  @override
  _showlistdataState createState() => _showlistdataState();
}

class _showlistdataState extends State<showlistdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xff0096a5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 30, bottom: 30),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 10),
                      child: Image.asset(
                        'images/wash.png',
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                'Car Washer',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    //fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Open for car wash reservation service',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    //fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                'From 10.00 - 17.45 PM',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 13,
                                    //fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'November 2021',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              
              margin: EdgeInsets.only(left: 20, top: 20, right: 20),
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoDates("Mon", "21", true),
                  demoDates("Tue", "22", false),
                  demoDates("Wed", "23", false),
                  demoDates("Thr", "24", false),
                  demoDates("Fri", "25", false),
                  demoDates("Sat", "26", false),
                  demoDates("Sun", "27", false),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'Time',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: GridView.count(
                
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2.7,
                children: [
                  doctorTimings("10.00 น.", true),
                  doctorTimings("10.30 น.", false),
                  doctorTimings("11.00 น.", false),
                  doctorTimings("11.30 น.", false),
                  doctorTimings("12.00 น.", false),
                  doctorTimings("13.00 น.", false),
                  doctorTimings("13.30 น.", false),
                  doctorTimings("14.00 น.", false),
                  doctorTimings("14.30 น.", false),
                  doctorTimings("15.00 น.", false),
                  doctorTimings("15.30 น.", false),
                  doctorTimings("16.00 น.", false),
                  doctorTimings("16.30 น.", false),
                  doctorTimings("17.00 น.", false),
                  doctorTimings("17.30 น.", false),
                ],
              ),
            ),
            Container(
              
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff107163),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                
                'ทำการจอง',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  doctorTimings(String time, bool isSelected) {
    return isSelected
        ? Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Color(0xff107163),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.access_time,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  demoDates(String day, String date, bool isSelected) {
    return isSelected
        ? Container(
            width: 70,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.teal.shade800,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    day,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(7),
                  child: Text(
                    date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        : Container(
            width: 70,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    day,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(7),
                  child: Text(
                    date,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          );
  }
}
