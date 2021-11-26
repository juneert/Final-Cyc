import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Color(0xff006876);
  Color prinaryColor = Color(0xff0096a5);
  Color lightColor = Color(0xff56c7d6);

  Widget showLogo() => Image.asset('images/car1.png');

  Widget titleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      );
  Widget titleH22(String string) => Text(
        string,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      );

  Widget titleH2White(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      );

  Widget titleH3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16,
          //fontWeight: FontWeight.bold,
          color: darkColor,
        ),
      );

  Widget titleH3White(String string) => Text(
        string,
        style: const TextStyle(
          fontSize: 14,
          //fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      );

  MyStyle();
}
