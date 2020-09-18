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
PreferredSizeWidget mpAppBar({@required Widget title}) {
  return AppBar(
    title: title,
  );
}

//TODO: Make universal AppBar
// PreferredSizeWidget mpAppBar({@required Widget title, BuildContext context}) {
//   if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
//     var brightness = MediaQuery.of(context).platformBrightness;
//     bool darkModeOn = brightness == Brightness.dark;
//     print(darkModeOn);

//     return CupertinoNavigationBar(
//       middle: title,
//       brightness: darkModeOn ? Brightness.dark : Brightness.light,
//     );
//   } else
//     return AppBar(
//       title: title,
//     );
// }

/// Switch

Widget mpSwitch(
    {@required BuildContext context,
    @required String title,
    @required bool value,
    @required ValueChanged<bool> onChanged,
    @required Function onTap}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return ListTile(
      title: Text(title),
      trailing: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
      ),
      onTap: onTap,
    );
  } else {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
      onTap: onTap,
    );
  }
}
