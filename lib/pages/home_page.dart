import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/bmi_page.dart';
import 'package:kachculator/pages/rm_page.dart';
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
            Text(S.of(context).homePageBody),
            mpButton(
                label: S.of(context).bmiPageTitle,
                context: context,
                onPressed: () {
                  Navigator.pushNamed(context, BmiPage.id);
                }),
            SizedBox(height: 8.0),
            mpButton(
                label: S.of(context).homePagePower,
                context: context,
                onPressed: () {
                  Navigator.pushNamed(context, RmPage.id);
                }),
            SizedBox(height: 8.0),
            mpButton(
                label: S.of(context).homePageFood,
                context: context,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
