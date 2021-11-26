import 'package:cyc/widget/authen.dart';
import 'package:cyc/widget/my_service.dart';
import 'package:cyc/widget/register.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen':(BuildContext context) =>  Authen(),
  '/register':(BuildContext context) => Register(),
  '/myService':(BuildContext context) => MyService(),
};
