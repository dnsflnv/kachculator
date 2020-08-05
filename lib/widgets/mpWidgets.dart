import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

//TODO: One detection of targetPlatform on start.

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
PreferredSizeWidget mpAppBar({Widget title}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
    return CupertinoNavigationBar(
      middle: title,
    );
  else
    return AppBar(
      title: title,
    );
}
