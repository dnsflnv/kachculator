import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc_bfp.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/widgets/mp_widgets.dart';

class BfpPage extends StatefulWidget {
  static String id = '/bfp';

  @override
  _BfpPageState createState() => _BfpPageState();
}

class _BfpPageState extends State<BfpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeight;
  TextEditingController tcHeight;
  TextEditingController tcAge;
  double bmi = 0;
  Gender gender;
  String result = '';
  bool isUS;

  @override
  void initState() {
    super.initState();
    tcWeight = TextEditingController(text: '90');
    tcHeight = TextEditingController(text: '184');
    tcAge = TextEditingController(text: '41');
    gender = Gender.male;
    isUS = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).bfpPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    //Text(S.of(context).b),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcWeight,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).bmiWeight,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9]*\.?[0-9]*"))
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return S.of(context).bmiWeightValidation;
                          }
                          if (double.parse(value) <= 0) {
                            return S.of(context).bmiWeightValidation;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcHeight,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).bmiHeight,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9]*\.?[0-9]*"))
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return S.of(context).bmiHeightValidation;
                          }
                          if (double.parse(value) <= 0) {
                            return S.of(context).bmiHeightValidation;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcAge,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).age,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return S.of(context).ageValidation;
                          }
                          if (double.parse(value) <= 2) {
                            return S.of(context).absiAgeValidation;
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Radio(
                          value: Gender.female,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                        Text(S.of(context).female),
                        Radio(
                          value: Gender.male,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                        ),
                        Text(S.of(context).male),
                      ],
                    ),
                    mpSwitch(
                      context: this.context,
                      title: S.of(context).useImperialUS,
                      value: isUS,
                      onChanged: (bool value) {
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
                        if (_formKey.currentState.validate()) {
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
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                result: res,
                                title: S.of(context).bfpPageTitle,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
