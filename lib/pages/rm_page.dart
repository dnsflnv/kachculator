import 'package:flutter/material.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/generated/l10n.dart';

class RmPage extends StatefulWidget {
  static String id = '/rm';

  @override
  _RmPageState createState() => _RmPageState();
}

class _RmPageState extends State<RmPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeight;
  TextEditingController tcHeight;
  double bmi = 0;
  String result = '';

  @override
  void initState() {
    super.initState();
    tcWeight = TextEditingController(text: '90');
    tcHeight = TextEditingController(text: '184');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(label: S.of(context).rmPageTitle),
    );
  }
}
