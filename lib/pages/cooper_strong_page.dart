import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/models/calc_cooper_strong.dart';
import 'package:kachculator/pages/result_page.dart';
import 'package:kachculator/widgets/mpWidgets.dart';

class CooperStrongPage extends StatefulWidget {
  static String id = '/cooperStrong';

  @override
  _CooperStrongPageState createState() => _CooperStrongPageState();
}

class _CooperStrongPageState extends State<CooperStrongPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcMinutes;

  @override
  void initState() {
    super.initState();
    tcMinutes = TextEditingController(text: '4');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(title: Text(S.of(context).cooperStrongPageTitle)),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Text(S.of(context).cooperStrongPageDesc),
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: tcMinutes,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: S.of(context).cooperStrongMinutes,
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset('/images/cooper.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 32.0, right: 32.0),
                      child: mpButton(
                        label: S.of(context).calculate,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            String res = '';
                            String force = cooperStrong(
                                context: context,
                                minutes: int.parse(tcMinutes.text));
                            res = '''
**${S.of(context).cooperMark}:** $force
''';
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  result: res,
                                  title: S.of(context).cooperStrongPageTitle,
                                ),
                              ),
                            );
                          }
                        },
                      ),
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
