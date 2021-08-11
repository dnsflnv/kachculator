import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/calculators/calc_bfp.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:kachculator/widgets/multiplatform_widgets.dart';

class BfpPage extends StatefulWidget {
  static String id = '/bfp';

  @override
  _BfpPageState createState() => _BfpPageState();
}

class _BfpPageState extends State<BfpPage> {
  TextEditingController tcWeight = TextEditingController(text: '90');
  TextEditingController tcHeight = TextEditingController(text: '184');
  TextEditingController tcAge = TextEditingController(text: '41');
  bool weightError = false;
  bool heightError = false;
  bool ageError = false;
  double bmi = 0;
  Gender gender = Gender.male;
  String result = '';
  bool isUS = false;

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
    if (tcAge.text.isEmpty || double.parse(tcAge.text) <= 0) {
      setState(() {
        ageError = true;
      });
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MpScaffold(
      appBar: MpAppBar(title: Text(S.of(context).bfpPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //Text(S.of(context).b),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: MpTextField(
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
                    child: MpTextField(
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
                    child: MpTextField(
                      controller: tcAge,
                      labelText: S.of(context).age,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  if (ageError)
                    MpValidationMessage(
                      message: S.of(context).ageValidation,
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
                  MpSwitch(
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
                  MpButton(
                    label: S.of(context).calculate,
                    onPressed: () {
                      if (_validation()) return null;
                      double weight = double.parse(tcWeight.text);
                      double height = double.parse(tcHeight.text);
                      int age = int.parse(tcAge.text);
                      if (age > 85) age = 85;

                      if (isUS) {
                        weight = lbsToKg(weight);
                        height = inchToCm(height);
                      }

                      double bfp = calcBFP(
                          weightAthlete: weight,
                          heightAthleteCm: height,
                          gender: gender,
                          age: age);

                      String res = """
**${S.of(context).bfpPageTitle}:** ${bfp.toStringAsFixed(2)}%

**${S.of(context).bfpCategory}:** ${bodyFat(context: context, persent: bfp, gender: gender)}
"""; //
                      Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) => ResultPage(
                            result: res,
                            title: S.of(context).bfpPageTitle,
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
