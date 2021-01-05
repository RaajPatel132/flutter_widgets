import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedAlignSample extends StatefulWidget {
  @override
  _AnimatedAlignState createState() => _AnimatedAlignState();
}

class _AnimatedAlignState extends State<AnimatedAlign> {
  int ran;
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    ran = 10;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 500,
              width: 500,
              child: AnimatedAlign(
                  alignment: getAlignment(ran),
                  duration: Duration(milliseconds: 250),
                  child: Text('Animated align')),
            ),
            RaisedButton(
              padding: EdgeInsets.all(20),
              child: Text(
                'Action',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              onPressed: () {
                setState(() {
                  ran = random.nextInt(9);
                });
              },
            )
          ],
        ),
      ),
    );
  }

  getAlignment(int ran) {
    Alignment alignment;
    switch (ran) {
      case 0:
        alignment = Alignment.topLeft;
        break;
      case 1:
        alignment = Alignment.topCenter;
        break;
      case 2:
        alignment = Alignment.topRight;
        break;
      case 3:
        alignment = Alignment.centerLeft;
        break;
      case 4:
        alignment = Alignment.center;
        break;
      case 5:
        alignment = Alignment.centerRight;
        break;
      case 6:
        alignment = Alignment.bottomLeft;
        break;
      case 7:
        alignment = Alignment.bottomCenter;
        break;
      case 8:
        alignment = Alignment.bottomRight;
        break;
      default:
        alignment = Alignment.center;
        break;
    }
    return alignment;
  }
}
