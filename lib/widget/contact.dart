// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:cyc/utility/style.dart';
import 'package:flutter/material.dart';

class ContactUsList extends StatefulWidget {
  const ContactUsList({Key? key}) : super(key: key);

  @override
  _ContactUsListState createState() => _ContactUsListState();
}

class _ContactUsListState extends State<ContactUsList> {
  late double lat1, lat2, lng1, lng2, distance;
  late String distanceString;
  late int transport;
  late ComeraPosition position;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 198,
                width: 300,
                margin: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/car4.png',
                  fit: BoxFit.cover,
                )),
          ],
        ),
        const ListTile(
          leading: Icon(Icons.home),
          title: Text('236 ม.7 ต.วังมะปรางเหนือ อ.วังวิเศษ'),
        ),
        const ListTile(
          leading: Icon(Icons.phone),
          title: Text('1234567890'),
        ),
        showMap(),
      ],
    );
  }

  Container showMap() {
    if (lat1 != null) {
      LatLng latLng1 = LatLng(lat1, lng2);
      position = ComeraPosition(
      );
    }

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 48),
      //color: Colors.black38,
      height: 300,
      child: lat1!== null,
    );
  }
}

class ComeraPosition {
}

class LatLng {
  LatLng(double lat1, double lng2);
}
