import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc_bmi.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';

class BmiPage extends StatefulWidget {
  static String id = '/bmi';

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController tcWeight;
  bool weightError;
  TextEditingController tcHeight;
  bool heightError;
  double bmi = 0;
  String result = '';
  bool isUS;

  @override
  void initState() {
    super.initState();
    tcWeight = TextEditingController(text: '89.6');
    tcHeight = TextEditingController(text: '183.5');
    isUS = heightError = weightError = false;
  }

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(title: Text(S.of(context).bmiPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(S.of(context).bmiPageDesc),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: mpTextField(
                      controller: tcWeight,
                      labelText: S.of(context).bmiWeight,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                      ],
                    ),
                  ),
                  if (weightError)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Text(
                            S.of(context).bmiWeightValidation,
                            textScaleFactor: 0.8,
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: mpTextField(
                      controller: tcHeight,
                      labelText: S.of(context).bmiHeight,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                      ],
                    ),
                  ),
                  mpSwitch(
                    context: this.context,
                    title: S.of(context).useImperialUS,
                    value: isUS,
                    onChanged: (bool value) {
                      setState(() {
                        isUS = value;
                        double weight = double.parse(tcWeight.text);
                        double height = double.parse(tcHeight.text);
                        if (isUS) {
                          weight = kgToLbs(weight);
                          height = cmToInch(height);
                        } else {
                          weight = lbsToKg(weight);
                          height = inchToCm(height);
                        }
                        tcWeight.text = weight.toStringAsFixed(3);
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
                      // Validation
                      if (tcHeight.text.isEmpty) {
                        setState(() {
                          heightError = true;
                        });
                        return;
                      }
                      if (tcWeight.text.isEmpty) {
                        setState(() {
                          weightError = true;
                        });
                        return;
                      }

                      double weight = double.parse(tcWeight.text);
                      double height = double.parse(tcHeight.text);

                      if (isUS) {
                        weight = lbsToKg(weight);
                        height = inchToCm(height);
                      }

                      double bmi = calcBmi(
                          weightAthlete: weight, heightAthleteCm: height);

                      result = bmiInterpretation(bmi: bmi, context: context);

                      String res = """
**${S.of(context).bmi}:** ${bmi.toStringAsFixed(3)}

$result
                        """;
                      Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) => ResultPage(
                            result: res,
                            title: S.of(context).bmiPageTitle,
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
      ),
    );
  }
}
