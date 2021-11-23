import 'package:notice_anniversary/views/screens/ListPage.dart';
import 'package:notice_anniversary/views/screens/UpdatePage.dart';
import 'package:flutter/material.dart';

class ScreenConst {
  static int? anniversary_id = null;
  static Map<String, WidgetBuilder> screens = {
    '/': (context) => ListPage(),
    '/Add': (context) => UpdatePage(isUpdate: false),
    '/Update': (context) => UpdatePage(
          isUpdate: true,
          anniversary_id: anniversary_id,
        ),
  };
}
