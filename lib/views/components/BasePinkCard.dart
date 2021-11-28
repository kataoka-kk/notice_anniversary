import 'package:flutter/material.dart';

class BasePinkCard extends StatelessWidget {
  final Widget child;

  BasePinkCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      color: Colors.pink.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
