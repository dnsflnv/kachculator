import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/models/calc.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(S.of(context).rmPageDesc),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: mpTextField(
                context: context,
                labelText: 'Вес атлета',
                controller: tcWeightAthlete,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: mpTextField(
                context: context,
                labelText: 'Вес снаряда',
                controller: tcWeight,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: mpTextField(
                context: context,
                labelText: 'Количество повторов',
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
                Text('Женщина'),
                Radio(
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                Text('Мужчина'),
              ],
            ),
            mpButton(
                context: context,
                label: 'Test',
                onPressed: () {
                  Calc rm = Calc.rm(
                      context: context,
                      weightAthlete: double.parse(tcWeightAthlete.text),
                      weight: double.parse(tcWeight.text),
                      repeat: int.parse(tcRepeat.text),
                      gender: gender);
                  print(rm.oneRmBrzycki);
                  print(rm.oneRmEpley);
                  print(rm.oneRmLander);
                  print(rm.oneRmLombardi);
                  print(rm.oneRmMayhew);
                  print(rm.oneRmOConner);
                  print(rm.oneRmWathan);
                  print(rm.oneRmWilks);
                }),
          ],
        ),
      ),
    );
  }
}
