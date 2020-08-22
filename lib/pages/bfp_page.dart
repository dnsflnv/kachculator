import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/models/calc.dart';

class BfpPage extends StatefulWidget {
  static String id = '/bfp';

  @override
  _BfpPageState createState() => _BfpPageState();
}

class _BfpPageState extends State<BfpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeight;
  TextEditingController tcHeight;
  TextEditingController tcWaistCircumference;
  TextEditingController tcAge;
  double bmi = 0;
  Gender gender;
  String result = '';

  @override
  void initState() {
    super.initState();
    tcWeight = TextEditingController(text: '90');
    tcHeight = TextEditingController(text: '184');
    tcWaistCircumference = TextEditingController(text: '100');
    tcAge = TextEditingController(text: '41');
    gender = Gender.male;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(title: Text(S.of(context).absiPageTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // http://www.myhealthywaist.org/fileadmin/pdf/WCMG-Self-Measurement.pdf
                Text(S.of(context).absiPageDesc),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: tcWeight,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).bmiWeight,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value.isEmpty) {
                        return S.of(context).absiWaistCircumferenceValidation;
                      }
                      if (double.parse(value) <= 0) {
                        return S.of(context).absiWaistCircumferenceValidation;
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
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                mpButton(
                  label: S.of(context).calculate,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      double weight = double.parse(tcWeight.text);
                      double height = double.parse(tcHeight.text);
                      int age = int.parse(tcAge.text);
                      if (age > 85) age = 85;
                      double waistCircumference =
                          double.parse(tcWaistCircumference.text);
                      Calc calc = Calc.absi(
                        context: context,
                        weightAthlete: weight,
                        heightAthleteCm: height,
                        gender: gender,
                        age: age,
                        waistCircumferenceCm: waistCircumference,
                      );
                      // https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0039504
                      String res = """

"""; //
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            result: res,
                            title: S.of(context).absiPageTitle,
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
    );
  }
}
