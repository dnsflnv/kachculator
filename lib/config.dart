import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Place to themes, configuration constants, etc.

final bool isApple = !kIsWeb && (Platform.isMacOS || Platform.isIOS);
// final bool isApple = false;

final ThemeData materialLight = ThemeData(
  primarySwatch: Colors.blue,
  buttonColor: Colors.blue,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final ThemeData materialDark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
);

CupertinoThemeData cupertinoTheme() {
  final Brightness brightness = //Brightness.dark;
      WidgetsBinding.instance!.window.platformBrightness;
  return CupertinoThemeData(
    //textTheme: CupertinoTextThemeData(brightness: darkModeOn ? Brightness.dark : Brightness.light,),
    brightness: brightness, //darkModeOn ? Brightness.dark : Brightness.light,
  );
}

const String demicalRegExp = "^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$";
