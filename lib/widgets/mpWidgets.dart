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
      //color: Theme.of(context).primaryColor, //Colors.blue,
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

/// Switch
/*class MpSwitch extends StatefulWidget {
  @override
  _MpSwitchState createState() => _MpSwitchState();
}

class _MpSwitchState extends State<MpSwitch> {
  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
      return ListTile(
        title: Text('isAthlete'),
        trailing: CupertinoSwitch(
          value: isAthlete,
          onChanged: (bool value) {
            setState(() {
              isAthlete = value;
            });
          },
        ),
        onTap: () {
          setState(() {
            isAthlete = !isAthlete;
          });
        },
      );
    else
      return ListTile(
        title: Text('isAthlete'),
        trailing: Switch(
          value: isAthlete,
          onChanged: (bool value) {
            setState(() {
              isAthlete = value;
            });
          },
        ),
        onTap: () {
          setState(() {
            isAthlete = !isAthlete;
          });
        },
      );
  }
}*/

// Widget mpPageRoute({Function(BuildContext) builder}) {
//   if (!kIsWeb && (Platform.isMacOS || Platform.isIOS))
//     return CupertinoPageRoute(builder:  builder);
//   else
//     return MaterialPageRoute(builder: builder);
// }
