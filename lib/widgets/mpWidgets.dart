import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:flutter/services.dart';

// ignore: todo
//TODO: One detection of targetPlatform on start.

/// Button.
Widget mpButton({BuildContext context, String label, Function onPressed}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
    return CupertinoButton.filled(
      child: Text(label),
      onPressed: onPressed,
    );
  else
    return RaisedButton(
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
}

/// Text field.
Widget mpTextField(
    {BuildContext context,
    TextEditingController controller,
    String labelText,
    List<TextInputFormatter> inputFormatters}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          labelText,
          style: TextStyle(color: CupertinoColors.label),
        ),
        SizedBox(
          height: 8.0,
        ),
        CupertinoTextField(
          controller: controller,
          inputFormatters: inputFormatters,
        ),
      ],
    );
  } else {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      inputFormatters: inputFormatters,
    );
  }
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
