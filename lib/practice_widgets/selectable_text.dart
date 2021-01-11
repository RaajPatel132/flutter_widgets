import 'package:flutter/material.dart';

class SelectableTextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: SelectableText(
          'Hello! How are you? what are you doing and how is your flutter career going',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
