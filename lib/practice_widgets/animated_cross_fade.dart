import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCrossFadeTest extends StatefulWidget {
  @override
  _AnimatedCrossFadeTestState createState() => _AnimatedCrossFadeTestState();
}

class _AnimatedCrossFadeTestState extends State<AnimatedCrossFadeTest> {
  bool isFirst;

  @override
  void initState() {
    super.initState();
    isFirst = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          firstChild: Text('this is the first child'),
          secondChild: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          crossFadeState:
              isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
        RaisedButton(
          child: Text('action'),
          color: Colors.red,
          onPressed: () {
            setState(() {
              isFirst = !isFirst;
            });
          },
        )
      ],
    );
  }
}
