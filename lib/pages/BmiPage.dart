import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:kachculator/widgets/mpWidgets.dart';
import 'package:kachculator/models/CalcBody.dart';

class BmiPage extends StatefulWidget {
  static String id = '/bmi';

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tcWeight = TextEditingController(text: '90');
  TextEditingController tcHeight = TextEditingController(text: '184');
  double bmi = 0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mpAppBar(label: S.of(context).bmiPageTitle),
      body: Padding(
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
                    // if (value == 0) {
                    //   return 'Please enter weight';
                    // }
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
                    // if (value == 0) {
                    //   return 'Please enter weight';
                    // }
                    return null;
                  },
                ),
              ),
              mpButton(
                label: S.of(context).bmiCalculate,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    double weight = double.parse(tcWeight.text);
                    double height = double.parse(tcHeight.text);
                    CalcBody calc =
                        CalcBody(weightKg: weight, heightCm: height);
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
    );
  }
}
