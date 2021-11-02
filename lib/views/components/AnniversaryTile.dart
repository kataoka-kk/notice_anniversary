import 'package:flutter/material.dart';

Widget AnniversaryTile() {
  return Row(
    children: <Widget>[
      Column(
        children: <Widget>[
          Text("1-1", style: TextStyle(fontSize: 20.0)),
          Text("1-2", style: TextStyle(fontSize: 20.0)),
        ],
      ),
      Column(
        children: <Widget>[
          Text("2-1", style: TextStyle(fontSize: 20.0)),
          Text("2-2", style: TextStyle(fontSize: 20.0)),
        ],
      ),
    ],
  );
}
