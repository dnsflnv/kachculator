import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/models/calc_mcrobert.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';

class McRobertPage extends StatefulWidget {
  static String id = '/mcrobert';

  @override
  _McRobertPageState createState() => _McRobertPageState();
}

class _McRobertPageState extends State<McRobertPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcHeight;
  String result = '';
  bool isUS;

  @override
  void initState() {
    super.initState();
    tcHeight = TextEditingController(text: '184');
    isUS = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(title: Text(S.of(context).mcrobertPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(S.of(context).mcrobertPageDesc),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcHeight,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).bmiHeight,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value.isEmpty || double.parse(value) <= 0) {
                            return S.of(context).bmiHeightValidation;
                          }
                          return null;
                        },
                      ),
                    ),
                    mpSwitch(
                      context: this.context,
                      title: S.of(context).useImperialUS,
                      value: isUS,
                      onChanged: (bool value) {
                        setState(() {
                          isUS = value;
                          double height = double.parse(tcHeight.text);
                          if (isUS) {
                            height = cmToInch(height);
                          } else {
                            height = inchToCm(height);
                          }
                          tcHeight.text = height.toStringAsFixed(2);
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
                        if (_formKey.currentState.validate()) {
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
|  $key  |  ${isUS ? cmToInch(value[0]).toStringAsFixed(2) : value[0].toStringAsFixed(2)}  |${isUS ? cmToInch(value[1]).toStringAsFixed(2) : value[1].toStringAsFixed(2)}  |
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
                        }
                      },
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
