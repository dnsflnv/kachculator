import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachkulator/pages/BmiPage.dart';
import 'package:kachkulator/pages/HomePage.dart';
import 'package:kachkulator/pages/RmPage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kachculator',
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
