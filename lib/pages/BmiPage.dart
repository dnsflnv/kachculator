import 'package:flutter/material.dart';
import 'package:kachkulator/widgets/mpWidgets.dart';

class BmiPage extends StatelessWidget {
  static String id = '/bmi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(label: 'Menu'),
    );
  }
}
