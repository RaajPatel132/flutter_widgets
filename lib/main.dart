import 'package:flutter/material.dart';
import 'package:flutter_6/practice_widgets/banner.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practice app',
      home: Scaffold(body: SafeArea(child: BannerTest())),
    );
  }
}
