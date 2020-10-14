import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:kachculator/calculators/calc_lbm.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/result_page.dart';
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
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            padding: EdgeInsets.all(8.0),
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
                mpSelectFromTwo(
                  value1: Gender.female,
                  value2: Gender.male,
                  itemText1: S.of(context).female,
                  itemText2: S.of(context).male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                mpSwitch(
                  context: this.context,
                  title: S.of(context).useImperialUS,
                  value: isUS,
                  onChanged: (bool value) {
                    if (_validation()) return null;
                    setState(() {
                      isUS = value;
                      double weight = double.parse(tcWeight.text);
                      double height = double.parse(tcHeight.text);

                      if (isUS) {
                        weight = kgToLbs(weight);
                        height = cmToInch(height);
                      } else {
                        weight = lbsToKg(weight);
                        height = inchToCm(height);
                      }
                      tcWeight.text = weight.toStringAsFixed(3);
                      tcHeight.text = height.toStringAsFixed(1);
                    });
                  },
                  onTap: () {
                    setState(() {
                      isUS = !isUS;
                    });
                  },
                ),
                mpButton(
                  label: S.of(context).calculate,
                  onPressed: () {
                    if (_validation()) return null;
                    double weight = double.parse(tcWeight.text);
                    double height = double.parse(tcHeight.text);

                    if (isUS) {
                      weight = lbsToKg(weight);
                      height = inchToCm(height);
                    }

                    double boer = calcLbmBoer(
                      weight: weight,
                      gender: gender,
                      heightCm: height,
                    );

                    double hume = calcLbmBoer(
                      weight: weight,
                      gender: gender,
                      heightCm: height,
                    );

                    if (isUS) {
                      boer = kgToLbs(boer);
                      hume = kgToLbs(hume);
                    }

                    String res = """
**${S.of(context).lbmPageTitle} Boer**: ${boer.toStringAsFixed(3)}

**${S.of(context).lbmPageTitle} Hume**: ${hume.toStringAsFixed(3)}
"""; //
                    Navigator.push(
                      context,
                      mpPageRoute(
                        builder: (context) => ResultPage(
                          result: res,
                          title: S.of(context).lbmPageTitle,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
