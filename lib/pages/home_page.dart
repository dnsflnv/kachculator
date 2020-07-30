import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/bmi_page.dart';
import 'package:kachculator/pages/rm_page.dart';
import 'package:native_widgets/native_widgets.dart';

class HomePage extends StatelessWidget {
  static String id = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NativeAppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NativeText(
              S.of(context).homePageBody,
              type: NativeTextTheme.title,
            ),
            NativeButton(
                child: Text(S.of(context).bmiPageTitle),
                onPressed: () {
                  Navigator.pushNamed(context, BmiPage.id);
                }),
            NativeText(
              S.of(context).homePagePower,
              type: NativeTextTheme.title,
            ),
            NativeButton(
                child: Text(S.of(context).rmPageTitle),
                onPressed: () {
                  Navigator.pushNamed(context, RmPage.id);
                }),
          ],
        ),
      ),
    );
  }
}
