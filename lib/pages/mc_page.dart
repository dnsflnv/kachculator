import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/models/calc_mccallum.dart';

class McPage extends StatefulWidget {
  static String id = '/mc';

  @override
  _McPageState createState() => _McPageState();
}

class _McPageState extends State<McPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWrist;
  String result = '';

  @override
  void initState() {
    super.initState();
    tcWrist = TextEditingController(text: '17');
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
                    mpButton(
                      label: S.of(context).calculate,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          double wrist = double.parse(tcWrist.text);
                          Map<String, double> mac =
                              mcCallum(wristCm: wrist, context: context);
                          String res = '''
|**${S.of(context).mcPart}**|**cm**|
|---|---|
''';
                          mac.forEach((key, value) {
                            res += '''
|  $key  |  ${value.toStringAsFixed(2)}  |
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
