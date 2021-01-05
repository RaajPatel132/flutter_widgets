import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.yellow,
      height: 100,
      child: ClipRect(
        child: Banner(
          message: "hello",
          location: BannerLocation.topStart,
          color: Colors.red,
          child: Container(
            color: Colors.yellow,
            height: 100,
            child: Center(
              child: Text("Hello, banner!"),
            ),
          ),
        ),
      ),
    );
  }
}
