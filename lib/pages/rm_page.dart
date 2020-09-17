import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/models/calc_rm.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/generated/l10n.dart';

class RmPage extends StatefulWidget {
  static String id = '/rm';

  @override
  _RmPageState createState() => _RmPageState();
}

class _RmPageState extends State<RmPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeightAthlete;
  TextEditingController tcWeight;
  TextEditingController tcRepeat;
  Gender gender;

  @override
  void initState() {
    super.initState();
    tcWeightAthlete = TextEditingController(text: '90');
    tcWeight = TextEditingController(text: '100');
    tcRepeat = TextEditingController(text: '8');
    gender = Gender.male;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(title: Text(S.of(context).rmPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(S.of(context).rmPageDesc),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcWeightAthlete,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).bmiWeight,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: tcWeight,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: S.of(context).rmBarebellWeight,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value.isEmpty) {
                              return S.of(context).rmBarebellWeightValidation;
                            }
                            if (double.parse(value) <= 0) {
                              return S.of(context).rmBarebellWeightValidation;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcRepeat,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).rmRepeats,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value.isEmpty) {
                            return S.of(context).rmRepeatValidation;
                          }
                          if (double.parse(value) <= 0) {
                            return S.of(context).rmRepeatValidation;
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
                        context: context,
                        label: S.of(context).calculate,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            CalcRm rm = CalcRm(
                                weightAthlete:
                                    double.parse(tcWeightAthlete.text),
                                weight: double.parse(tcWeight.text),
                                repeat: int.parse(tcRepeat.text),
                                gender: gender);
                            String res = ''' 
|**${S.of(context).rmMethod}**|**${S.of(context).rmResult}**|
|---|---|
|${S.of(context).Brzycki}|${rm.oneRmBrzycki.toStringAsFixed(3)}|
|${S.of(context).Epley}|${rm.oneRmEpley.toStringAsFixed(3)}|
|${S.of(context).Lander}|${rm.oneRmLander.toStringAsFixed(3)}|
|${S.of(context).Lombardi}|${rm.oneRmLombardi.toStringAsFixed(3)}|
|${S.of(context).Mayhew}|${rm.oneRmMayhew.toStringAsFixed(3)}|
|${S.of(context).OConner}|${rm.oneRmOConner.toStringAsFixed(3)}|
|${S.of(context).Wathan}|${rm.oneRmWathan.toStringAsFixed(3)}|
|${S.of(context).Wilks}|${rm.oneRmWilks.toStringAsFixed(3)}|
''';
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  result: res,
                                  title: S.of(context).rmPageTitle,
                                ),
                              ),
                            );
                          }
                        }),
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
