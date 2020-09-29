import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:kachculator/widgets/cupertino_text_form_field.dart';
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
        Text(labelText),
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
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      inputFormatters: inputFormatters,
    );
  }
}

/// Text FORM field
Widget mpTextFormField({
  BuildContext context,
  TextEditingController controller,
  String labelText,
  List<TextInputFormatter> inputFormatters,
  String Function(String) validator,
}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(labelText),
        SizedBox(
          height: 8.0,
        ),
        CupertinoTextFormField(
          controller: controller,
          inputFormatters: inputFormatters,
          validator: validator,
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
      validator: validator,
    );
  }
}

/// AppBar.
PreferredSizeWidget mpNavigationBar(
    {@required Widget title, BuildContext context}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return CupertinoNavigationBar(
      middle: title,
    );
  } else
    return AppBar(
      title: title,
    );
}

/// Switch
Widget mpSwitch(
    {@required BuildContext context,
    @required String title,
    @required bool value,
    @required ValueChanged<bool> onChanged,
    Function onTap}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(title),
        ),
        Expanded(
          flex: 1,
          child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
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

/// Scaffold
Widget mpScaffold(
    {@required BuildContext context,
    PreferredSizeWidget navigationBar,
    @required Widget body}) {
  if (!kIsWeb && (Platform.isMacOS || Platform.isIOS)) {
    return CupertinoPageScaffold(
      navigationBar: navigationBar,
      child: body,
    );
  } else {
    return Scaffold(
      appBar: navigationBar,
      body: body,
    );
  }
}
