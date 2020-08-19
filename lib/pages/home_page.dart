import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/bmi_page.dart';
import 'package:kachculator/pages/rm_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';

import '../widgets/mpWidgets.dart';

class HomePage extends StatelessWidget {
  static String id = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).homePageBody),
            mpButton(
              context: context,
              label: S.of(context).bmiPageTitle,
              onPressed: () {
                Navigator.pushNamed(context, BmiPage.id);
              },
            ),
            Text(S.of(context).homePagePower),
            mpButton(
              context: context,
              label: S.of(context).rmPageTitle,
              onPressed: () {
                Navigator.pushNamed(context, RmPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
