import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachkulator/pages/BmiPage.dart';
import 'package:kachkulator/pages/RmPage.dart';
import 'package:kachkulator/widgets/mpWidgets.dart';

class HomePage extends StatelessWidget {
  static String id = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(label: 'Menu'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            mpButton(
                label: 'Body',
                context: context,
                onPressed: () {
                  Navigator.pushNamed(context, BmiPage.id);
                }),
            SizedBox(height: 8.0),
            mpButton(
                label: 'Power',
                context: context,
                onPressed: () {
                  Navigator.pushNamed(context, RmPage.id);
                }),
            SizedBox(height: 8.0),
            mpButton(label: 'Food', context: context, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
