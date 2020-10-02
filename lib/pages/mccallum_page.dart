import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';
import 'package:kachculator/models/calc_mccallum.dart';

class McCallumPage extends StatefulWidget {
  static String id = '/mc';

  @override
  _McCallumPageState createState() => _McCallumPageState();
}

class _McCallumPageState extends State<McCallumPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWrist;
  bool wristError;
  String result = '';
  bool isUS;

  bool _validation() {
    if (tcWrist.text.isEmpty || double.parse(tcWrist.text) <= 0) {
      setState(() {
        wristError = true;
      });
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    tcWrist = TextEditingController(text: '17.5');
    isUS = wristError = false;
  }

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(
        title: Text(S.of(context).mcPageTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(S.of(context).mcPageDesc),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: mpTextField(
                      controller: tcWrist,
                      labelText: S.of(context).mcWrist,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(demicalRegExp))
                      ],
                    ),
                  ),
                  if (wristError)
                    MpValidationMessage(
                      message: S.of(context).mcWristValidation,
                    ),
                  mpSwitch(
                    context: this.context,
                    title: S.of(context).useImperialUS,
                    value: isUS,
                    onChanged: (bool value) {
                      if (_validation()) return null;
                      setState(() {
                        isUS = value;
                        double wrist = double.parse(tcWrist.text);
                        if (isUS) {
                          wrist = cmToInch(wrist);
                        } else {
                          wrist = inchToCm(wrist);
                        }
                        tcWrist.text = wrist.toStringAsFixed(1);
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
                      if (_validation()) return null;
                      double wrist = double.parse(tcWrist.text);
                      if (isUS) {
                        wrist = inchToCm(wrist);
                      }
                      Map<String, double> mac =
                          mcCallum(wristCm: wrist, context: context);
                      String res = '''
|**${S.of(context).mcPart}**|**${isUS ? S.of(context).inch : S.of(context).cm}**|
|---|---|
''';
                      mac.forEach((key, value) {
                        res += '''
|  $key  |  ${isUS ? cmToInch(value).toStringAsFixed(1) : value.toStringAsFixed(1)}  |
''';
                      });
                      Navigator.push(
                        context,
                        mpPageRoute(
                          builder: (context) => ResultPage(
                            result: res,
                            title: S.of(context).mcPageTitle,
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
