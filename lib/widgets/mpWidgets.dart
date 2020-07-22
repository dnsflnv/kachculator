import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

/// Button.
Widget mpButton({BuildContext context, String label, Function onPressed}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
    return CupertinoButton.filled(
      child: Text(label),
      onPressed: onPressed,
    );
  else
    return MaterialButton(
      child: Text(label),
      onPressed: onPressed,
    );
}

/// AppBar.
PreferredSizeWidget mpAppBar({String label}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
    return CupertinoNavigationBar(
      middle: Text(label),
    );
  else
    return AppBar(
      title: Text(label),
    );
}
