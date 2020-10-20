import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:kachculator/calculators/calc_ifp.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';

class IfpPage extends StatefulWidget {
  static String id = '/ifp';

  @override
  _IfpPageState createState() => _IfpPageState();
}

class _IfpPageState extends State<IfpPage> {
  TextEditingController tcBodyweight;
  TextEditingController tcTotal;
  bool errorTotal;
  bool errorBodyweight;
  Gender gender;
  bool isUS;
  Equipment equipment; // equipment
  Event event;

  @override
  void initState() {
    super.initState();
    tcBodyweight = TextEditingController(text: '90');
    tcTotal = TextEditingController(text: '300');
    gender = Gender.male;
    isUS = errorTotal = errorBodyweight = false;
    equipment = Equipment.raw;
    event = Event.sbd;
  }

  bool _validation() {
    if (tcBodyweight.text.isEmpty || double.parse(tcBodyweight.text) <= 0) {
      setState(() {
        errorBodyweight = true;
      });
      return true;
    }
    if (tcTotal.text.isEmpty || double.parse(tcTotal.text) <= 0) {
      setState(() {
        errorTotal = true;
      });
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(title: Text(S.of(context).ifpPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Text(S.of(context).ifpPageDescription),
                // Total weight
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: mpTextField(
                    controller: tcTotal,
                    labelText: S.of(context).ifpTotalWeight,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                    ],
                  ),
                ),
                if (errorTotal)
                  MpValidationMessage(
                    message: S.of(context).rmBarebellWeightValidation,
                  ),
                // Bodyweight
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: mpTextField(
                    controller: tcBodyweight,
                    labelText: S.of(context).bmiWeight,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                    ],
                  ),
                ),
                if (errorTotal)
                  MpValidationMessage(
                    message: S.of(context).bmiWeightValidation,
                  ),

                mpSwitch(
                  context: this.context,
                  title: S.of(context).useImperialUS,
                  value: isUS,
                  onChanged: (bool value) {
                    if (_validation()) return null;
                    setState(() {
                      isUS = value;
                      double total = double.parse(tcTotal.text);
                      double bodyweight = double.parse(tcBodyweight.text);
                      if (isUS) {
                        total = kgToLbs(total);
                        bodyweight = kgToLbs(bodyweight);
                      } else {
                        total = lbsToKg(total);
                        bodyweight = lbsToKg(bodyweight);
                      }
                      tcTotal.text = total.toStringAsFixed(3);
                      tcBodyweight.text = bodyweight.toStringAsFixed(3);
                    });
                  },
                  onTap: () {
                    setState(() {
                      isUS = !isUS;
                    });
                  },
                ),
                SizedBox(
                  height: 8.0,
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
                SizedBox(
                  height: 8.0,
                ),
                mpSelectFromTwo(
                  value1: Equipment.raw,
                  value2: Equipment.singlePly,
                  itemText1: S.of(context).ifpRaw,
                  itemText2: S.of(context).ifpSingleply,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      equipment = value;
                    });
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                mpSelectFromTwo(
                  value1: Event.sbd,
                  value2: Event.b,
                  itemText1: S.of(context).ifp3Lift,
                  itemText2: S.of(context).ifpBench,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      event = value;
                    });
                  },
                ),
                SizedBox(
                  height: 8.0,
                ),
                mpButton(
                  context: context,
                  label: S.of(context).calculate,
                  onPressed: () {
                    if (_validation()) return null;
                    double total = double.parse(tcTotal.text);
                    double bodyweight = double.parse(tcBodyweight.text);
                    if (isUS) {
                      total = lbsToKg(total);
                      bodyweight = lbsToKg(bodyweight);
                    }

                    Map<String, double> result = calcIFP(
                        bodyweight: bodyweight,
                        total: total,
                        gender: gender,
                        equipment: equipment,
                        event: event);

                    String res = """
**GLP**: ${result["glp"].toStringAsFixed(3)}

**Dots**: ${result["dots"].toStringAsFixed(3)}
"""; //
                    Navigator.push(
                      context,
                      mpPageRoute(
                        builder: (context) => ResultPage(
                          result: res,
                          title: S.of(context).ifpPageTitle,
                        ),
                      ),
                    );
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
