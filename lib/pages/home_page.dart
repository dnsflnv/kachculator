import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/absi_page.dart';
import 'package:kachculator/pages/bfp_page.dart';
import 'package:kachculator/pages/bmi_page.dart';
import 'package:kachculator/pages/cooper_page.dart';
import 'package:kachculator/pages/mc_page.dart';
import 'package:kachculator/pages/rfm_page.dart';
import 'package:kachculator/pages/rm_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';

class HomePage extends StatelessWidget {
  static String id = '/';
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(
        title: Text(S.of(context).title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                S.of(context).homePageBody,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pushNamed(context, BmiPage.id);
                      },
                      child: Column(
                        children: [
                          Image.asset('icons/icons8-bmi-96.png'),
                          Text(
                            S.of(context).bmiPageTitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pushNamed(context, AbsiPage.id);
                      },
                      child: Column(
                        children: [
                          Image.asset(
                              'icons/icons8-dead-man-in-a-coffin-96.png'),
                          Text(
                            S.of(context).absiPageTitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pushNamed(context, BfpPage.id);
                      },
                      child: Column(
                        children: [
                          Image.asset('icons/icons8-fat-man-cry-96.png'),
                          Text(
                            S.of(context).bfpPageTitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pushNamed(context, RfmPage.id);
                      },
                      child: Column(
                        children: [
                          Image.asset('icons/icons8-sumo-96.png'),
                          Text(
                            S.of(context).rfmPageTitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 32.0),
            Center(
              child: Text(
                S.of(context).homePageProportions,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pushNamed(context, McPage.id);
                      },
                      child: Column(
                        children: [
                          Image.asset('icons/icons8-bodybuilder-96.png'),
                          Text(
                            S.of(context).mcPageTitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 32.0),
            Center(
              child: Text(
                S.of(context).homePagePower,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pushNamed(context, RmPage.id);
                      },
                      child: Column(
                        children: [
                          Image.asset('icons/icons8-deadlift-96.png'),
                          Text(
                            S.of(context).rmPageTitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(8.0),
                      onPressed: () {
                        Navigator.pushNamed(context, CooperPage.id);
                      },
                      child: Column(
                        children: [
                          Image.asset('icons/icons8-running-96.png'),
                          Text(
                            S.of(context).cooperPageTitle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 16.0),
            mpButton(
              context: context,
              label: S.of(context).about,
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationIcon: FlutterLogo(),
                  applicationName: S.of(context).title,
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2020 Denis Filonov',
                  children: [
                    Text('Icons by https://icons8.com'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
