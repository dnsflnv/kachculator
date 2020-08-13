import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(S.of(context).rmPageDesc),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: mpTextField(
                  context: context,
                  labelText: S.of(context).bmiWeight,
                  controller: tcWeightAthlete,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: mpTextField(
                  context: context,
                  labelText: S.of(context).rmBarebellWeight,
                  controller: tcWeight,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: mpTextField(
                  context: context,
                  labelText: S.of(context).rmRepeats,
                  controller: tcRepeat,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    double wa = double.parse(tcWeightAthlete.text);
                    double w = double.parse(tcWeight.text);
                    int r = int.parse(tcRepeat.text);
                    //TODO Validation here
                    if (wa <= 0 || w <= 0 || r <= 0) return;

                    Calc rm = Calc.rm(
                        context: context,
                        weightAthlete: double.parse(tcWeightAthlete.text),
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
