import 'package:flutter/material.dart';
import 'package:notice_anniversary/const/ConstInfo.dart';

class AnniversaryTile extends StatelessWidget {
  final int month;
  final int day;
  final int tag;
  final String title;

  AnniversaryTile({
    required this.month,
    required this.day,
    required this.tag,
    required this.title,
  });

  String tagName() {
    switch (tag) {
      case 0:
        return "記念日";
      case 1:
        return "誕生日";
      default:
        return "その他";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: Colors.pink.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text(
                          "$month月$day日",
                          style: TextStyle(
                            fontSize: tileFontSizeSmall,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Text(
                        tagName(),
                        style: TextStyle(
                          fontSize: tileFontSizeSmall,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "$title",
                style: TextStyle(
                  fontSize: tileFontSizeLarge,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
