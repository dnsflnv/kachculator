import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachkulator/widgets/mpWidgets.dart';
import 'package:kachkulator/models/CalcBody.dart';

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
      appBar: mpAppBar(label: 'BMI'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('This calculate your Body Mass Index.'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: tcWeight,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Weight',
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your weight in kilogramms.';
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
                    labelText: 'Height',
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your height in cantimeters.';
                    }
                    // if (value == 0) {
                    //   return 'Please enter weight';
                    // }
                    return null;
                  },
                ),
              ),
              mpButton(
                label: 'Calculate',
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
              if (bmi > 0) Text('BMI: ${bmi.toStringAsFixed(2)}'),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
