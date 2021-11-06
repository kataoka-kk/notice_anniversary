import 'package:flutter/material.dart';

Widget AnniversaryTile() {
  return Container(
    height: 200,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("1-1", style: TextStyle(fontSize: 20.0)),
              Text("1-2", style: TextStyle(fontSize: 80.0)),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("2-1", style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
      ],
    ),
  );

  // return Row(
  //   children: <Widget>[
  //     Container(
  //       height: 100,
  //       child: Column(
  //
  //       ),
  //
  //     ),
  //
  //
  //
  //     // Expanded(
  //     //   flex: 1,
  //     //   child: Column(
  //     //     // crossAxisAlignment: CrossAxisAlignment.values = [CrossAxisAlignment.center,CrossAxisAlignment.center],
  //     //     children: <Widget>[
  //     //       Text("1-1", style: TextStyle(fontSize: 20.0)),
  //     //       Text("2-1", style: TextStyle(fontSize: 80.0)),
  //     //     ],
  //     //   ),
  //     // ),
  //     // Column(
  //     //   mainAxisAlignment: MainAxisAlignment.end,
  //     //   crossAxisAlignment: CrossAxisAlignment.end,
  //     //   children: <Widget>[
  //     //     Text("2-2", style: TextStyle(fontSize: 40.0)),
  //     //   ],
  //     // ),
  //   ],
  // );
}
