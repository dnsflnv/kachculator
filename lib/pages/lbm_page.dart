import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:kachculator/widgets/mp_widgets.dart';

class LbmPage extends StatefulWidget {
  static String id = '/lbm';

  @override
  _LbmPageState createState() => _LbmPageState();
}

class _LbmPageState extends State<LbmPage> {
  TextEditingController tcWeight;
  TextEditingController tcHeight;
  bool heightError;
  bool weightError;
  Gender gender;
  String result = '';
  bool isUS;

  bool _validation() {
    if (tcHeight.text.isEmpty || double.parse(tcHeight.text) <= 0) {
      setState(() {
        heightError = true;
      });
      return true;
    }
    if (tcWeight.text.isEmpty || double.parse(tcWeight.text) <= 0) {
      setState(() {
        weightError = true;
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(title: Text('lbm')),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              Text('Description of this'),
              mpTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
