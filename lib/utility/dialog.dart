// ignore_for_file: prefer_void_to_null, prefer_const_constructors

import 'package:flutter/material.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Image.asset('images/car2.png'),
        title: Text('Normal Dialog'),
        subtitle: Text(string),
      ),
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    ),
  );
}
