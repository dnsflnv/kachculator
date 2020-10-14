import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/config.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:kachculator/calculators/calc_mcrobert.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mp_widgets.dart';

class McRobertPage extends StatefulWidget {
  static String id = '/mcrobert';

  @override
  _McRobertPageState createState() => _McRobertPageState();
}

class _McRobertPageState extends State<McRobertPage> {
  TextEditingController tcHeight;
  bool heightError;
  String result = '';
  bool isUS;

  bool _validation() {
    if (tcHeight.text.isEmpty || double.parse(tcHeight.text) <= 0) {
      setState(() {
        heightError = true;
      });
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    tcHeight = TextEditingController(text: '184');
    isUS = heightError = false;
  }

  @override
  Widget build(BuildContext context) {
    return mpScaffold(
      appBar: mpAppBar(
        title: Text(S.of(context).mcrobertPageTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(S.of(context).mcrobertPageDesc),
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
                  if (heightError)
                    MpValidationMessage(
                      message: S.of(context).bmiHeightValidation,
                    ),
                  mpSwitch(
                    context: this.context,
                    title: S.of(context).useImperialUS,
                    value: isUS,
                    onChanged: (bool value) {
                      if (_validation()) return null;
                      setState(() {
                        isUS = value;
                        double height = double.parse(tcHeight.text);
                        if (isUS) {
                          height = cmToInch(height);
                        } else {
                          height = inchToCm(height);
                        }
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
                      if (_validation()) return null;
                      double height = double.parse(tcHeight.text);
                      if (isUS) {
                        height = inchToCm(height);
                      }
                      Map<String, List<double>> mac =
                          mcRobert(context: context, heightCm: height);
                      String res = '''
|**${S.of(context).mcPart}**|**${S.of(context).mcrobertMin}**|**${S.of(context).mcrobertMax}**|
|---|---|---|
''';
                      mac.forEach((key, value) {
                        res += '''
|  $key  |  ${isUS ? cmToInch(value[0]).toStringAsFixed(1) : value[0].toStringAsFixed(1)}  |${isUS ? cmToInch(value[1]).toStringAsFixed(1) : value[1].toStringAsFixed(1)}  |
''';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            result: res,
                            title: S.of(context).mcrobertPageTitle,
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
