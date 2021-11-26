// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({Key? key}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
//################################################//
// Column1//
//################################################//
        Expanded(
          child: Column(
            children: <Widget>[
//################################################//
// Column1.1
//################################################//
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('images/scb.png'),
                ),
                title: const Text('SCB QR'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('images/cash.png'),
                ),
                title: const Text('Cash'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('images/creditcard.png'),
                ),
                title: const Text('Credit Card'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('images/online.jpg'),
                ),
                title: const Text('Online Banking'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('images/line.png'),
                ),
                title: const Text('Line Pay'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black12,
              ),

//################################################//
// Column1.2
//################################################//

//################################################//
// Column1.3
//################################################//
            ],
          ),
        ),
//################################################//
// Column2//
        //################################################//
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black12,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const <Widget>[
              Expanded(
                  child: Text(
                'Total Amount',
                style: TextStyle(fontSize: 25),
              )),
              Text(
                '150',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.black12,
        ),
      ],
    ));
  }
}
