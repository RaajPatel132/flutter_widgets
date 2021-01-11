import 'package:flutter/material.dart';

class BaseLineTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        height: 220.0,
        width: 220.0,
        child: Baseline(
          child: Container(
            color: Colors.red,
            height: 160.0,
            width: 210.0,
          ),
          baseline: 10.0,
          baselineType: TextBaseline.alphabetic,
        ),
      ),
    );
  }
}
