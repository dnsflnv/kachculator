import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/models/calc.dart';

class AbsiPage extends StatefulWidget {
  static String id = '/absi';
  // https://nirkrakauer.net/sw/absi-calculator.html

  @override
  _AbsiPageState createState() => _AbsiPageState();
}

class _AbsiPageState extends State<AbsiPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeight;
  TextEditingController tcHeight;
  TextEditingController tcWaistCircumference;
  double bmi = 0;
  String result = '';

  @override
  void initState() {
    super.initState();
    tcWeight = TextEditingController(text: '90');
    tcHeight = TextEditingController(text: '184');
    tcWaistCircumference = TextEditingController(text: '100');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(title: Text(S.of(context).absiPageTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(S.of(context).bmiPageDesc),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: tcWeight,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).bmiWeight,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value.isEmpty) {
                        return S.of(context).bmiWeightValidation;
                      }
                      if (double.parse(value) <= 0) {
                        return S.of(context).bmiWeightValidation;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: tcHeight,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).bmiHeight,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value.isEmpty) {
                        return S.of(context).bmiHeightValidation;
                      }
                      if (double.parse(value) <= 0) {
                        return S.of(context).bmiHeightValidation;
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: tcHeight,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).bmiHeight,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value.isEmpty) {
                        return S.of(context).bmiHeightValidation;
                      }
                      if (double.parse(value) <= 0) {
                        return S.of(context).bmiHeightValidation;
                      }
                      return null;
                    },
                  ),
                ),
                mpButton(
                  label: S.of(context).calculate,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      double weight = double.parse(tcWeight.text);
                      double height = double.parse(tcHeight.text);
                      Calc calc = Calc.bmi(
                          weightAthlete: weight,
                          heightAthleteCm: height,
                          context: context);
                      setState(() {
                        bmi = calc.bmi;
                        result = calc.bmiInterpretation(bmi);
                      });
                    }
                  },
                ),
                if (bmi > 0)
                  Text('${S.of(context).bmi}: ${bmi.toStringAsFixed(2)}'),
                Text(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
