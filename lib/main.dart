import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/pages/absi_page.dart';
import 'package:kachculator/pages/bmi_page.dart';
import 'package:kachculator/pages/home_page.dart';
import 'package:kachculator/pages/rm_page.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
// Localization
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  if (!kIsWeb) _setTargetPlatformForDesktop();
  runApp(App());
}

void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

class App extends StatelessWidget {
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
      //title: 'Kachculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        BmiPage.id: (context) => BmiPage(),
        RmPage.id: (context) => RmPage(),
        AbsiPage.id: (context) => AbsiPage()
      },
    );

//TODO return this app, if mac
    //return CupertinoApp();
  }
}
