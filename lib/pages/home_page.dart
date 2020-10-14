import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/about_page.dart';
import 'package:kachculator/pages/absi_page.dart';
import 'package:kachculator/pages/bfp_page.dart';
import 'package:kachculator/pages/bmi_page.dart';
import 'package:kachculator/pages/cooper_page.dart';
import 'package:kachculator/pages/mccallum_page.dart';
import 'package:kachculator/pages/mcrobert_page.dart';
import 'package:kachculator/pages/rfm_page.dart';
import 'package:kachculator/pages/rm_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';
import 'cooper_strong_page.dart';

class HomePage extends StatelessWidget {
  static String id = '/';
  final controller = ScrollController();

  Future<String> _loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  /// Preparing data for "About" page
  /// TODO: Change to FutureBuilder
  void getAboutPage(BuildContext context) async {
    Locale myLocale = Localizations.localeOf(context);
    String about = await _loadAsset("text/$myLocale/about.md");
    String history = await _loadAsset("docs/history.md");
    Navigator.push(
      context,
      mpPageRoute(
        builder: (context) {
          return AboutPage(
            about: about,
            history: history,
          );
        },
      ),
    );
  }

  @override
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
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 350.0,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
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
                        ),
                      ],
                    ),
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
