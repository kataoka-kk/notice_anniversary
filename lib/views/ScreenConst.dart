import 'package:notice_anniversary/views/screens/ListPage.dart';
import 'package:notice_anniversary/views/screens/UpdatePage.dart';
import 'package:flutter/material.dart';

class ScreenConst {
  static Map<String, WidgetBuilder> screens = {
    '/': (context) => ListPage(),
    '/Update': (context) => UpdatePage(isUpdate: true),
    '/Add': (context) => UpdatePage(isUpdate: false),
  };
}
