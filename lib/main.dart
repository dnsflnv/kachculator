import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/pages/BmiPage.dart';
import 'package:kachculator/pages/HomePage.dart';
import 'package:kachculator/pages/RmPage.dart';
// Localization
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  runApp(App());
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
      initialRoute: '/',
      routes: {
        HomePage.id: (context) => HomePage(),
        BmiPage.id: (context) => BmiPage(),
        RmPage.id: (context) => RmPage(),
      },
      //home: HomePage(),
    );
  }
}
