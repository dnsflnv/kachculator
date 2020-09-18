import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/models/calc_mccallum.dart';

class McCallumPage extends StatefulWidget {
  static String id = '/mc';

  @override
  _McCallumPageState createState() => _McCallumPageState();
}

class _McCallumPageState extends State<McCallumPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWrist;
  String result = '';
  bool isUS;

  @override
  void initState() {
    super.initState();
    tcWrist = TextEditingController(text: '17.5');
    isUS = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(title: Text(S.of(context).mcPageTitle)),
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
                    Text(S.of(context).mcPageDesc),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcWrist,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).mcWrist,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (value) {
                          if (value.isEmpty || double.parse(value) <= 0) {
                            return S.of(context).mcWristValidation;
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
                          double wrist = double.parse(tcWrist.text);
                          if (isUS) {
                            wrist = cmToInch(wrist);
                          } else {
                            wrist = inchToCm(wrist);
                          }
                          tcWrist.text = wrist.toStringAsFixed(2);
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
|  $key  |  ${isUS ? cmToInch(value).toStringAsFixed(2) : value.toStringAsFixed(2)}  |
''';
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                result: res,
                                title: S.of(context).mcPageTitle,
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
