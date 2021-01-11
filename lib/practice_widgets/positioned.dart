import 'package:flutter/material.dart';

class PositionedTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 10,
            top: 70,
            right: 10,
            bottom: 70,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
