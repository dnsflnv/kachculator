import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/multiplatform_widgets.dart';
import 'package:kachculator/calculators/calc_cooper_vomax.dart';

class CooperPage extends StatefulWidget {
  static String id = '/cooper';

  @override
  _CooperPageState createState() => _CooperPageState();
}

class _CooperPageState extends State<CooperPage> {
  TextEditingController tcDistanse = TextEditingController(text: '2700');
  TextEditingController tcAge = TextEditingController(text: '42');
  bool isAthlete = false;
  Gender gender = Gender.male;
  bool isUS = false;
  bool ageError = false;
  bool distanceError = false;

  bool _validation() {
    if (tcDistanse.text.isEmpty || double.parse(tcDistanse.text) <= 0) {
      setState(() {
        distanceError = true;
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
      appBar: MpAppBar(
        title: Text(S.of(context).cooperPageTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Text(S.of(context).cooperPageDesc),
                  SizedBox(
                    height: 8.0,
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: MpTextField(
                      controller: tcDistanse,
                      labelText: S.of(context).cooperDistanse,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(demicalRegExp)),
                      ],
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
                      });
                    },
                  ),
                  MpSwitch(
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
                  MpSwitch(
                    title: S.of(context).useImperialUS,
                    value: isUS,
                    onChanged: (bool value) {
                      setState(() {
                        if (_validation()) return null;
                        isUS = value;
                        double distanse = double.parse(tcDistanse.text);
                        if (isUS) {
                          distanse = mererToMile(distanse);
                        } else {
                          distanse = mileToMeter(distanse);
                        }
                        tcDistanse.text = distanse.toStringAsFixed(3);
                      });
                    },
                    onTap: () {
                      setState(() {
                        isUS = !isUS;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 32.0, right: 32.0),
                    child: MpButton(
                      label: S.of(context).calculate,
                      onPressed: () {
                        if (_validation()) return null;
                        String res = '';
                        double distanse = double.parse(tcDistanse.text);
                        if (isUS) {
                          distanse = mileToMeter(distanse);
                        }

                        String run = cooperRun(
                          distanse: distanse.toInt(),
                          gender: gender,
                          age: int.parse(tcAge.text),
                          isAthlete: this.isAthlete,
                          context: context,
                        );
                        String vo =
                            cooperVoMax(distanse: distanse).toStringAsFixed(2);
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
                      },
                    ),
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
