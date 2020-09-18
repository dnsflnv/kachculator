import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc_rfm.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/models/calc.dart';

class RfmPage extends StatefulWidget {
  static String id = '/rfm';

  @override
  _RfmPageState createState() => _RfmPageState();
}

class _RfmPageState extends State<RfmPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcHeight;
  TextEditingController tcWaistCircumference;
  Gender gender;
  String result = '';
  bool isUS;

  @override
  void initState() {
    super.initState();
    tcHeight = TextEditingController(text: '184');
    tcWaistCircumference = TextEditingController(text: '86');
    gender = Gender.male;
    isUS = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(title: Text(S.of(context).rfmPageTitle)),
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
                    Text(S.of(context).rfmPageDescription),
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
                        controller: tcWaistCircumference,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).absiWaistCircumference,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9]*\.?[0-9]*"))
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return S
                                .of(context)
                                .absiWaistCircumferenceValidation;
                          }
                          if (double.parse(value) <= 0) {
                            return S
                                .of(context)
                                .absiWaistCircumferenceValidation;
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
                        if (_formKey.currentState.validate()) {
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
