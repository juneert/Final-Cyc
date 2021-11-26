// ignore_for_file: avoid_print, non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_void_to_null

import 'package:cyc/utility/dialog.dart';
import 'package:cyc/utility/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  late double screen;
  bool statusRedEye = true;
  String? user, password, email;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    print('screen = $screen');
    return Scaffold(
      floatingActionButton: BuildRegister(),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(0, -0.33),
              radius: 1.0,
              colors: <Color>[Colors.white, MyStyle().lightColor]),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildLogo(),
              MyStyle().titleH1('Car is Care'),
              buildUser(),
              buildPassword(),
              BuildLogin(),
            ],
          ),
        ),
      ),
    );
  }

  TextButton BuildRegister() => TextButton(
        onPressed: () => Navigator.pushNamed(context, '/register'),
        child: Text(
          'NEW REGISTER',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      );

  Container BuildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 302,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(context, 'มีช่องว่าง กรุณากรอกข้อมูลให้ครบถ้วน');
          } else {
            checkAuhen();
          }
        },
        child: Text('Login'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().darkColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Container buildUser() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade50,
      ),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => user!.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintText: 'User :',
          prefixIcon: Icon(Icons.perm_identity, color: MyStyle().darkColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade50,
      ),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: statusRedEye,
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: statusRedEye
                  ? Icon(Icons.remove_red_eye)
                  : Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                setState(() {
                  statusRedEye = !statusRedEye;
                });
                print('statusRedEye = $statusRedEye');
              }),
          hintText: 'Password :',
          prefixIcon: Icon(Icons.lock_outline, color: MyStyle().darkColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MyStyle().lightColor),
          ),
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(width: screen * 0.4, child: MyStyle().showLogo());
  }

  Future<Null> checkAuhen() async {
    await Firebase.initializeApp().then((value) async {
      // ignore: prefer_typing_uninitialized_variables
      var user, password;
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user, password: password)
          .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/myService', (route) => false))
          .catchError((value) => normalDialog(context, value.message));
    });
  }
}
