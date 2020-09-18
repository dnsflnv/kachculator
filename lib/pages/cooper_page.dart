import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/models/calc_cooper_vomax.dart';

class CooperPage extends StatefulWidget {
  static String id = '/cooper';

  @override
  _CooperPageState createState() => _CooperPageState();
}

class _CooperPageState extends State<CooperPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcDistanse;
  TextEditingController tcAge;
  bool isAthlete;
  Gender gender;
  bool isUS;

  @override
  void initState() {
    super.initState();
    tcDistanse = TextEditingController(text: '2700');
    tcAge = TextEditingController(text: '41');
    gender = Gender.male;
    isAthlete = false;
    isUS = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(title: Text(S.of(context).cooperPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Text(S.of(context).cooperPageDesc),
                    SizedBox(
                      height: 8.0,
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
                          if (value.isEmpty || double.parse(value) <= 0) {
                            return S.of(context).ageValidation;
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcDistanse,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).cooperDistanse,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value.isEmpty || double.parse(value) <= 0) {
                            return S.of(context).cooperDistanseValidation;
                          }
                          return null;
                        },
                      ),
                    ),
                    mpSwitch(
                      context: this.context,
                      title: S.of(context).isAthlete,
                      value: isAthlete,
                      onChanged: (bool value) {
                        setState(() {
                          isAthlete = value;
                        });
                      },
                      onTap: () {
                        setState(() {
                          isAthlete = !isAthlete;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 32.0, right: 32.0),
                      child: mpButton(
                        label: S.of(context).calculate,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            String res = '';
                            String run = cooperRun(
                              distanse: int.parse(tcDistanse.text),
                              gender: gender,
                              age: int.parse(tcAge.text),
                              isAthlete: this.isAthlete,
                              context: context,
                            );
                            String vo = cooperVoMax(
                                    distanse: double.parse(tcDistanse.text))
                                .toStringAsFixed(2);
                            res = '''
**${S.of(context).cooperMark}:** $run 

**VO2 max =** $vo''';
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  result: res,
                                  title: S.of(context).cooperPageTitle,
                                ),
                              ),
                            );
                          }
                        },
                      ),
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
