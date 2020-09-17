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
  TextEditingController tcWeight;
  TextEditingController tcHeight;
  TextEditingController tcWaistCircumference;
  TextEditingController tcAge;
  double bmi;
  Gender gender;
  String result = '';

  @override
  void initState() {
    super.initState();
    bmi = 0;
    tcWeight = TextEditingController(text: '90');
    tcHeight = TextEditingController(text: '184');
    tcWaistCircumference = TextEditingController(text: '96');
    tcAge = TextEditingController(text: '41');
    gender = Gender.male;
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
                          FilteringTextInputFormatter.digitsOnly
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
                          FilteringTextInputFormatter.digitsOnly
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
                    mpButton(
                      label: S.of(context).calculate,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          double height = double.parse(tcHeight.text);
                          int age = int.parse(tcAge.text);
                          if (age > 85) age = 85;
                          double waistCircumference =
                              double.parse(tcWaistCircumference.text);
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
