import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActionSheetTest extends StatefulWidget {
  @override
  _CupertinoActionSheetTestState createState() =>
      _CupertinoActionSheetTestState();
}

class _CupertinoActionSheetTestState extends State<CupertinoActionSheetTest> {
  bool isWaiting;

  @override
  void initState() {
    isWaiting = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isWaiting
          ? CupertinoActivityIndicator()
          : RaisedButton(
              child: Text('Click me'),
              onPressed: () {
                setState(() {
                  isWaiting = true;
                });
                Timer(Duration(seconds: 3), () {
                  _handleClickMe(context);
                });
              },
            ),
    );
  }

  Future<void> _handleClickMe(BuildContext context) async {
    setState(() {
      isWaiting = false;
    });
    return showCupertinoModalPopup<void>(
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Favorite Dessert'),
          message:
              Text('Please select the best dessert from the options below.'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Profiteroles'),
              onPressed: () {
                _handleClickMe2();
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Cannolis'),
              onPressed: () {},
            ),
            CupertinoActionSheetAction(
              child: Text('Trifie'),
              onPressed: () {},
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
      context: context,
    );
  }

  Future<void> _handleClickMe2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
              'Allow "Maps" to access your location while you use the app?'),
          content: Text(
              'Your current location will be displayed on the map and used for directions, nearby search results, and estimated travel times.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Don\'t Allow'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Allow'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
