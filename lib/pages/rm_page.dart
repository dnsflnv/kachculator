import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/models/calc_rm.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';
import 'package:kachculator/generated/l10n.dart';

class RmPage extends StatefulWidget {
  static String id = '/rm';

  @override
  _RmPageState createState() => _RmPageState();
}

class _RmPageState extends State<RmPage> {
  TextEditingController tcWeightAthlete;
  TextEditingController tcWeight;
  TextEditingController tcRepeat;
  bool weightError;
  bool weightAthleteError;
  bool repeatError;
  Gender gender;
  bool isUS;

  @override
  void initState() {
    super.initState();
    tcWeightAthlete = TextEditingController(text: '90');
    tcWeight = TextEditingController(text: '134');
    tcRepeat = TextEditingController(text: '3');
    gender = Gender.male;
    isUS = weightError = weightAthleteError = repeatError = false;
  }

  bool _validation() {
    if (tcWeightAthlete.text.isEmpty ||
        double.parse(tcWeightAthlete.text) <= 0) {
      setState(() {
        weightAthleteError = true;
      });
      return true;
    }
    if (tcWeight.text.isEmpty || double.parse(tcWeight.text) <= 0) {
      setState(() {
        weightError = true;
      });
      return true;
    }
    if (tcRepeat.text.isEmpty || double.parse(tcRepeat.text) <= 0) {
      setState(() {
        repeatError = true;
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(
        title: Text(S.of(context).rmPageTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(S.of(context).rmPageDesc),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: mpTextField(
                      controller: tcWeightAthlete,
                      labelText: S.of(context).bmiWeight,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                      ],
                    ),
                  ),
                  if (weightAthleteError)
                    MpValidationMessage(
                      message: S.of(context).bmiWeightValidation,
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: mpTextField(
                        controller: tcWeight,
                        labelText: S.of(context).rmBarebellWeight,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(demicalRegExp))
                        ],
                      ),
                    ),
                  ),
                  if (weightError)
                    MpValidationMessage(
                      message: S.of(context).rmBarebellWeightValidation,
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: mpTextField(
                      controller: tcRepeat,
                      labelText: S.of(context).rmRepeats,
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
                        double weight = double.parse(tcWeight.text);
                        double weightAthlete =
                            double.parse(tcWeightAthlete.text);
                        if (isUS) {
                          weight = kgToLbs(weight);
                          weightAthlete = kgToLbs(weightAthlete);
                        } else {
                          weight = lbsToKg(weight);
                          weightAthlete = lbsToKg(weightAthlete);
                        }
                        tcWeight.text = weight.toStringAsFixed(3);
                        tcWeightAthlete.text = weightAthlete.toStringAsFixed(3);
                      });
                    },
                    onTap: () {
                      setState(() {
                        isUS = !isUS;
                      });
                    },
                  ),
                  mpButton(
                      context: context,
                      label: S.of(context).calculate,
                      onPressed: () {
                        if (_validation()) return null;
                        double weightAthlete =
                            double.parse(tcWeightAthlete.text);
                        double weight = double.parse(tcWeight.text);
                        if (isUS) {
                          weight = lbsToKg(weight);
                          weightAthlete = lbsToKg(weightAthlete);
                        }
                        CalcRm rm = CalcRm(
                            weightAthlete: weightAthlete,
                            weight: weight,
                            repeat: int.parse(tcRepeat.text),
                            gender: gender);
                        String res = ''' 
|**${S.of(context).rmMethod}**|**${S.of(context).rmResult}**|
|---|---|
|${S.of(context).Brzycki}|${isUS ? kgToLbs(rm.oneRmBrzycki).toStringAsFixed(3) : rm.oneRmBrzycki.toStringAsFixed(3)}|
|${S.of(context).Epley}|${isUS ? kgToLbs(rm.oneRmEpley).toStringAsFixed(3) : rm.oneRmEpley.toStringAsFixed(3)}|
|${S.of(context).Lander}|${isUS ? kgToLbs(rm.oneRmLander).toStringAsFixed(3) : rm.oneRmLander.toStringAsFixed(3)}|
|${S.of(context).Lombardi}|${isUS ? kgToLbs(rm.oneRmLombardi).toStringAsFixed(3) : rm.oneRmLombardi.toStringAsFixed(3)}|
|${S.of(context).Mayhew}|${isUS ? kgToLbs(rm.oneRmMayhew).toStringAsFixed(3) : rm.oneRmMayhew.toStringAsFixed(3)}|
|${S.of(context).OConner}|${isUS ? kgToLbs(rm.oneRmOConner).toStringAsFixed(3) : rm.oneRmOConner.toStringAsFixed(3)}|
|${S.of(context).Wathan}|${isUS ? kgToLbs(rm.oneRmWathan).toStringAsFixed(3) : rm.oneRmWathan.toStringAsFixed(3)}|
|${S.of(context).Wilks}|${isUS ? kgToLbs(rm.oneRmWilks).toStringAsFixed(3) : rm.oneRmWilks.toStringAsFixed(3)}|
''';
                        Navigator.push(
                          context,
                          mpPageRoute(
                            builder: (context) => ResultPage(
                              result: res,
                              title: S.of(context).rmPageTitle,
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
