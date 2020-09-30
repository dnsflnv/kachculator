import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/models/calc_absi.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';

class AbsiPage extends StatefulWidget {
  static String id = '/absi';

  @override
  _AbsiPageState createState() => _AbsiPageState();
}

class _AbsiPageState extends State<AbsiPage> {
  TextEditingController tcWeight;
  bool weightError;
  TextEditingController tcHeight;
  bool heightError;
  TextEditingController tcWaistCircumference;
  bool waistCircumferenceError;
  TextEditingController tcAge;
  bool ageError;

  double bmi = 0;
  Gender gender;
  String result = '';
  bool isUS;

  @override
  void initState() {
    super.initState();
    tcWeight = TextEditingController(text: '90');
    tcHeight = TextEditingController(text: '184');
    tcWaistCircumference = TextEditingController(text: '84');
    tcAge = TextEditingController(text: '41');
    gender = Gender.male;
    isUS =
        weightError = heightError = waistCircumferenceError = ageError = false;
  }

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(title: Text(S.of(context).absiPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // http://www.myhealthywaist.org/fileadmin/pdf/WCMG-Self-Measurement.pdf
                  Text(S.of(context).absiPageDesc),
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: mpTextField(
                      controller: tcAge,
                      labelText: S.of(context).age,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
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
                        print(gender);
                      });
                    },
                  ),
                  // Row(
                  //   children: [
                  //     Radio(
                  //       value: Gender.female,
                  //       groupValue: gender,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           gender = value;
                  //         });
                  //       },
                  //     ),
                  //     Text(S.of(context).female), ththtyh
                  //     Radio(
                  //       value: Gender.male,
                  //       groupValue: gender,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           gender = value;
                  //         });
                  //       },
                  //     ),
                  //     Text(S.of(context).male),
                  //   ],
                  // ),
                  mpSwitch(
                    context: this.context,
                    title: S.of(context).useImperialUS,
                    value: isUS,
                    onChanged: (bool value) {
                      setState(() {
                        isUS = value;
                        double weight = double.parse(tcWeight.text);
                        double height = double.parse(tcHeight.text);
                        double waistCircumference =
                            double.parse(tcWaistCircumference.text);
                        if (isUS) {
                          weight = kgToLbs(weight);
                          height = cmToInch(height);
                          waistCircumference = cmToInch(waistCircumference);
                        } else {
                          weight = lbsToKg(weight);
                          height = inchToCm(height);
                          waistCircumference = inchToCm(waistCircumference);
                        }
                        tcWeight.text = weight.toStringAsFixed(3);
                        tcHeight.text = height.toStringAsFixed(1);
                        tcWaistCircumference.text =
                            waistCircumference.toStringAsFixed(1);
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
                      double weight = double.parse(tcWeight.text);
                      double height = double.parse(tcHeight.text);
                      int age = int.parse(tcAge.text);
                      if (age > 85) age = 85;
                      double waistCircumference =
                          double.parse(tcWaistCircumference.text);

                      if (isUS) {
                        weight = lbsToKg(weight);
                        height = inchToCm(height);
                        waistCircumference = inchToCm(waistCircumference);
                      }

                      CalcABSI calc = CalcABSI(
                        context: context,
                        weightAthlete: weight,
                        heightAthleteCm: height,
                        gender: gender,
                        age: age,
                        waistCircumferenceCm: waistCircumference,
                      );

                      String sGender = (gender == Gender.male)
                          ? S.of(context).male
                          : S.of(context).female;
                      String res = """
**${S.of(context).age}:** $age

**${S.of(context).gender}**: $sGender

**${S.of(context).bmiHeight}**: $height

**${S.of(context).bmiPageTitle}**: ${calc.bmi.toStringAsFixed(3)}

**${S.of(context).absiWaistCircumference}**: $waistCircumference

**ABSI:** ${calc.absi.toStringAsFixed(5)}

**${S.of(context).absiMean}**: ${calc.absiMean.toStringAsFixed(5)}

**${S.of(context).absiRisk}**: ${calc.absiRisk}
"""; //
                      Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) => ResultPage(
                            result: res,
                            title: S.of(context).absiPageTitle,
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
