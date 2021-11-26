// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, deprecated_member_use

import 'package:cyc/utility/dialog.dart';
import 'package:cyc/utility/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late double screen;
  bool statusRedEye = true;
  late String name, user, password;

  Container buildName() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.shade50,
      ),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintText: 'Name : ',
          prefixIcon: Icon(Icons.person, color: MyStyle().darkColor),
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
        onChanged: (value) => user = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintText: 'User :',
          prefixIcon: Icon(Icons.email_outlined, color: MyStyle().darkColor),
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

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(
        backgroundColor: MyStyle().prinaryColor,
        title: Text('New Register'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildName(),
            buildUser(),
            buildPassword(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: MyStyle().darkColor,
      onPressed: () {
        print('name =$name, user = $user, password = $password');
        if ((name?.isEmpty ?? true) ||
            (user?.isEmpty ?? true) ||
            (password?.isEmpty ?? true)) {
          print('Have space');
          normalDialog(context, 'Have space ?Please Fill Every Blank');
        } else {
          print('No Space');
          registerFirebase();
        }
      },
      child: Icon(Icons.add),
    );
  }

  // ignore: prefer_void_to_null
  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('######Firebase Initialize Success ########');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user, password: password)
          .then((value) async {
        print('Register Success');
        await value.user?.updateProfile(displayName: name).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/myService', (route) => false));
      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }
}
