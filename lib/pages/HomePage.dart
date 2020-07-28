import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/BmiPage.dart';
import 'package:kachculator/pages/RmPage.dart';
import 'package:kachculator/widgets/mpWidgets.dart';

class HomePage extends StatelessWidget {
  static String id = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(label: S.of(context).title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            mpButton(
                label: S.of(context).homePageBody,
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
