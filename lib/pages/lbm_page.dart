import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
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

  @override
  void initState() {
    super.initState();
    tcWeight = TextEditingController(text: '90');
    tcHeight = TextEditingController(text: '184');
    gender = Gender.male;
    isUS = weightError = heightError = false;
  }

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
      appBar: mpAppBar(title: Text(S.of(context).lbmPageTitle)),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget>[
              Text(S.of(context).lbmPageDescription),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: mpTextField(
                  controller: tcWeight,
                  labelText: S.of(context).bmiWeight,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                  ],
                ),
              ),
              if (weightError)
                MpValidationMessage(
                  message: S.of(context).bmiWeightValidation,
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: mpTextField(
                  controller: tcHeight,
                  labelText: S.of(context).bmiHeight,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                  ],
                ),
              ),
              if (heightError)
                MpValidationMessage(
                  message: S.of(context).bmiHeightValidation,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
