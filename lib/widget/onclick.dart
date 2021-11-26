// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class onclick extends StatefulWidget {
  const onclick({Key? key}) : super(key: key);

  @override
  _onclickState createState() => _onclickState();
}

class _onclickState extends State<onclick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {},
              color: Colors.green,
              child: const Text(
                'Acceptghthtyjyj',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () => {},
              color: Colors.red,
              child: const Text(
                'Cancfsfdel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () => {},
              color: Colors.red,
              child: const Text(
                'Cancelfsdfs',
                style: TextStyle(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () => {},
              color: Colors.green,
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
