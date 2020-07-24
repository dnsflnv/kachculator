import 'package:flutter/material.dart';
import 'package:kachkulator/widgets/mpWidgets.dart';

class RmPage extends StatelessWidget {
  static String id = '/rm';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(label: '1 RM calculation'),
    );
  }
}
