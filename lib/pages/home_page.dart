import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/about_page.dart';
import 'package:kachculator/pages/absi_page.dart';
import 'package:kachculator/pages/bfp_page.dart';
import 'package:kachculator/pages/bmi_page.dart';
import 'package:kachculator/pages/cooper_page.dart';
import 'package:kachculator/pages/ifp_page.dart';
import 'package:kachculator/pages/lbm_page.dart';
import 'package:kachculator/pages/mccallum_page.dart';
import 'package:kachculator/pages/mcrobert_page.dart';
import 'package:kachculator/pages/rfm_page.dart';
import 'package:kachculator/pages/rm_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';
import 'cooper_strong_page.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomePage extends StatelessWidget {
  static String id = '/';
  final controller = ScrollController();

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  /// Preparing data for "About" page
  // ignore: todo
  /// TODO: Change to FutureBuilder
  void getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //String appName = packageInfo.appName;
    //String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    //String buildNumber = packageInfo.buildNumber;

    String about = await _loadAsset("text/$myLocale/about.md");
    about = about.replaceAll('%version%', version);
    String history = await _loadAsset("docs/history.md");
    Navigator.push(
      context,
      mpPageRoute(
        builder: (context) {
          return AboutPage(
            about: about,
            history: history,
            version: version,
          );
        },
      ),
    );
  }

  //@override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(
        title: Text(S.of(context).title),
        button: mpLinkButton(
          context: context,
          label: S.of(context).about,
          onPressed: () {
            // Navigator.pushNamed(context, AboutPage.id);
            getAboutPage(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: GridView.extent(
            primary: false,
            padding: EdgeInsets.all(8),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 200.0,
            children: <Widget>[
              Container(
                child: mpFlatButton(
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
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.pushNamed(context, AbsiPage.id);
                  },
                  child: Column(
                    children: [
                      Image.asset('icons/icons8-dead-man-in-a-coffin-96.png'),
                      Text(
                        S.of(context).absiPageTitle,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
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
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
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
              Container(
                child: mpFlatButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.pushNamed(context, LbmPage.id);
                  },
                  child: Column(
                    children: [
                      Image.asset('icons/icons8-thriller-96.png'),
                      Text(
                        S.of(context).lbmPageTitle,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.pushNamed(context, McCallumPage.id);
                  },
                  child: Column(
                    children: [
                      Image.asset('icons/icons8-bodybuilder-96.png'),
                      Text(
                        S.of(context).mcPageTitle,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.pushNamed(context, McRobertPage.id);
                  },
                  child: Column(
                    children: [
                      Image.asset('icons/icons8-torso-96.png'),
                      Text(
                        S.of(context).mcrobertPageTitle,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
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
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.pushNamed(context, IfpPage.id);
                  },
                  child: Column(
                    children: [
                      Image.asset('icons/icons8-deadlift-96.png'),
                      Text(
                        S.of(context).ifpPageTitle,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
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
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: mpFlatButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {
                    Navigator.pushNamed(context, CooperStrongPage.id);
                  },
                  child: Column(
                    children: [
                      Image.asset('icons/icons8-pushups-96.png'),
                      Text(
                        S.of(context).cooperStrongPageTitle,
                        textAlign: TextAlign.center,
                        textScaleFactor: 0.9,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
