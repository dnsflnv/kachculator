import 'package:flutter/material.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/generated/l10n.dart';

class RmPage extends StatelessWidget {
  static String id = '/rm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(label: S.of(context).rmPageTitle),
    );
  }
}
