import 'package:flutter/material.dart';
import 'package:notice_anniversary/views/components/AnniversaryTile.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink.shade200,
          child: Icon(Icons.add),
          tooltip: "追加",
          onPressed: null,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AnniversaryTile(
                      month: 12,
                      day: 1,
                      tag: "誕生日",
                      title: "片岡の誕生日",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
