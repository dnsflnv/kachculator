import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/calculators/calc_bmi.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/multiplatform_widgets.dart';

class BmiPage extends StatefulWidget {
  static String id = '/bmi';

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController tcWeight = TextEditingController(text: '89.6');
  bool weightError = false;
  TextEditingController tcHeight = TextEditingController(text: '183.5');
  bool heightError = false;
  double bmi = 0;
  String result = '';
  bool isUS = false;

  bool _validation() {
    if (tcHeight.text.isEmpty || double.parse(tcHeight.text) <= 0) {
      setState(() {
        heightError = true;
      });
      return true;
    }
    if (tcWeight.text.isEmpty || double.parse(tcWeight.text) <= 0) {
      setState(() {
        weightError = true;
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
      appBar: MpAppBar(title: Text(S.of(context).bmiPageTitle)),
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
                    child: MpTextField(
                      controller: tcWeight,
                      labelText: S.of(context).bmiWeight,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                      ],
                    ),
                  ),
                  if (weightError)
                    MpValidationMessage(
                      message: S.of(context).bmiWeightValidation,
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: MpTextField(
                      controller: tcHeight,
                      labelText: S.of(context).bmiHeight,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                      ],
                    ),
                  ),
                  if (heightError)
                    MpValidationMessage(
                      message: S.of(context).bmiHeightValidation,
                    ),
                  MpSwitch(
                    title: S.of(context).useImperialUS,
                    value: isUS,
                    onChanged: (bool value) {
                      if (_validation()) return null;
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
                  MpButton(
                    label: S.of(context).calculate,
                    onPressed: () {
                      if (_validation()) return null;

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
