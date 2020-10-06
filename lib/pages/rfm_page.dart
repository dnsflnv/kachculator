import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc_rfm.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';
import 'package:kachculator/models/calc.dart';

class RfmPage extends StatefulWidget {
  static String id = '/rfm';

  @override
  _RfmPageState createState() => _RfmPageState();
}

class _RfmPageState extends State<RfmPage> {
  TextEditingController tcHeight;
  TextEditingController tcWaistCircumference;
  bool heightError;
  bool waistCircumferenceError;
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
    if (tcWaistCircumference.text.isEmpty ||
        double.parse(tcWaistCircumference.text) <= 0) {
      setState(() {
        waistCircumferenceError = true;
      });
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    tcHeight = TextEditingController(text: '184');
    tcWaistCircumference = TextEditingController(text: '86');
    gender = Gender.male;
    isUS = heightError = waistCircumferenceError = false;
  }

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(
        title: Text(S.of(context).rfmPageTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(S.of(context).rfmPageDescription),
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: mpTextField(
                      controller: tcWaistCircumference,
                      labelText: S.of(context).absiWaistCircumference,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                      ],
                    ),
                  ),
                  if (waistCircumferenceError)
                    MpValidationMessage(
                      message: S.of(context).absiWaistCircumferenceValidation,
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
                        double waistCircumference =
                            double.parse(tcWaistCircumference.text);
                        double height = double.parse(tcHeight.text);
                        if (isUS) {
                          waistCircumference = cmToInch(waistCircumference);
                          height = cmToInch(height);
                        } else {
                          waistCircumference = inchToCm(waistCircumference);
                          height = inchToCm(height);
                        }
                        tcWaistCircumference.text =
                            waistCircumference.toStringAsFixed(1);
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
                      double height = double.parse(tcHeight.text);
                      double waistCircumference =
                          double.parse(tcWaistCircumference.text);

                      if (isUS) {
                        waistCircumference = inchToCm(waistCircumference);
                        height = inchToCm(height);
                      }

                      double rfm = calcRFM(
                          heightAthleteCm: height,
                          gender: gender,
                          waistCircumferenceCm: waistCircumference);

                      String res = """
**${S.of(context).rfmPageTitle}**: ${rfm.toStringAsFixed(1)}%

**${S.of(context).bfpCategory}:** ${bodyFat(context: context, persent: rfm, gender: gender)}
"""; //
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            result: res,
                            title: S.of(context).rfmPageTitle,
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
      ),
    );
  }
}
