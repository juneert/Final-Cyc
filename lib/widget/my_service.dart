// ignore_for_file: prefer_void_to_null

import 'package:cyc/widget/contact.dart';
import 'package:cyc/widget/onclick.dart';
import 'package:cyc/widget/payment.dart';
import 'package:cyc/widget/showlist.dart';
import 'package:cyc/widget/status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cyc/utility/style.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String? name;
  String? email;
  Widget currentWidget = showlistdata();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    findNameAndEmail();
  }

  Future<Null> findNameAndEmail() async {
    await Firebase.initializeApp().then((value) async {
      // ignore: await_only_futures
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        name = event!.displayName!;
        email = event!.email!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().prinaryColor,
      ),
      drawer: buildDrawer(),
      body: currentWidget,
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccountsDrawerHeader(),
              buildIndex(),
              buildStatus(),
              buildPayment(),
              buildContactUs(),
              buildOnclick()
            ],
          ),
          BuildSignOut(),
        ],
      ),
    );
  }

  ListTile buildIndex() {
    return ListTile(
      leading: Icon(
        Icons.home,
        size: 36,
      ),
      title: Text('หน้าหลัก'),
      // subtitle: Text('จองเวลาและกรอกข้อมูลการจอง'),
      onTap: () {
        setState(() {
          currentWidget = showlistdata();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildStatus() {
    return ListTile(
      leading: Icon(
        Icons.access_time_filled,
        size: 36,
      ),
      title: Text('สถานะ'),
      // subtitle: Text('เช็คสถานะการล้างรถ'),
      onTap: () {
        setState(() {
          currentWidget = StatusList();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildPayment() {
    return ListTile(
      leading: Icon(
        Icons.payment,
        size: 36,
      ),
      title: Text('ช่องทางการชำระเงิน'),
      //subtitle: Text('ติดต่อและเช็คาถานที่ตั้ง'),
      onTap: () {
        setState(() {
          currentWidget = PaymentList();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildContactUs() {
    return ListTile(
      leading: Icon(
        Icons.contact_page,
        size: 36,
      ),
      title: Text('ติดต่อสอบถาม'),
      // subtitle: Text('ติดต่อและเช็คาถานที่ตั้ง'),
      onTap: () {
        setState(() {
          currentWidget = ContactUsList();
        });
        Navigator.pop(context);
      },
    );
  }

  ListTile buildOnclick() {
    return ListTile(
      leading: Icon(
        Icons.access_time_filled,
        size: 36,
      ),
      title: Text('Onclick'),
      // subtitle: Text('เช็คสถานะการล้างรถ'),
      onTap: () {
        setState(() {
          currentWidget = onclick();
        });
        Navigator.pop(context);
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: MyStyle().darkColor),
      accountName: Text(name ?? 'Name'),
      accountEmail: Text(email ?? 'email'),
      currentAccountPicture: Image.asset('images/car1.png'),
    );
  }

  // ignore: non_constant_identifier_names
  Column BuildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/authen', (route) => false));
            });
          },
          leading: const Icon(
            Icons.exit_to_app,
            color: Colors.white70,
            size: 36,
          ),
          title: MyStyle().titleH2White('Sign Out'),
          tileColor: MyStyle().darkColor,
          subtitle: MyStyle().titleH3White("ออกจากระบบ และกลับสู่หน้าหลัก"),
        ),
      ],
    );
  }
}
