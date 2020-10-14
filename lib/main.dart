import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/pages/about_page.dart';
import 'package:kachculator/pages/absi_page.dart';
import 'package:kachculator/pages/bfp_page.dart';
import 'package:kachculator/pages/bmi_page.dart';
import 'package:kachculator/pages/cooper_page.dart';
import 'package:kachculator/pages/cooper_strong_page.dart';
import 'package:kachculator/pages/home_page.dart';
import 'package:kachculator/pages/lbm_page.dart';
import 'package:kachculator/pages/mccallum_page.dart';
import 'package:kachculator/pages/mcrobert_page.dart';
import 'package:kachculator/pages/rfm_page.dart';
import 'package:kachculator/pages/rm_page.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
// Localization
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    runApp(AppCupertino());
  } else {
    runApp(AppMaterial());
  }
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  HomePage.id: (context) => HomePage(),
  AboutPage.id: (context) => AboutPage(),
  BmiPage.id: (context) => BmiPage(),
  RmPage.id: (context) => RmPage(),
  AbsiPage.id: (context) => AbsiPage(),
  RfmPage.id: (context) => RfmPage(),
  BfpPage.id: (context) => BfpPage(),
  McCallumPage.id: (context) => McCallumPage(),
  McRobertPage.id: (context) => McRobertPage(),
  CooperPage.id: (context) => CooperPage(),
  CooperStrongPage.id: (context) => CooperStrongPage(),
  LbmPage.id: (context) => LbmPage(),
};

class AppMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      initialRoute: HomePage.id,
      routes: appRoutes,
    );
  }
}

class AppCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (BuildContext context) => S.of(context).title,
      theme: cupertinoTheme(),
      initialRoute: HomePage.id,
      routes: appRoutes,
    );
  }
}
