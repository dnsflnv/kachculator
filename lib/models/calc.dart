import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:meta/meta.dart';

/// Body calculators.
class Calc {
  double weightKg;
  double heightCm;
  BuildContext context; // For localization

  Calc({@required this.weightKg, @required this.heightCm, this.context});

  double get bmi => this.weightKg / pow((this.heightCm / 100), 2);

  String bmiInterpretation(double bmi) {
    String result = '';
    if (bmi != null) {
      if (bmi < 15) {
        result = S.of(context).bmi15;
      } else if (bmi >= 15 && bmi < 16) {
        result = S.of(context).bmi15_16;
      } else if (bmi >= 16 && bmi < 18.5) {
        result = S.of(context).bmi16_18;
      } else if (bmi >= 18.5 && bmi < 25) {
        result = S.of(context).bmi18_25;
      } else if ((bmi >= 25) && (bmi < 30.0)) {
        result = S.of(context).bmi25_30;
      } else if (bmi >= 30 && bmi < 35.0) {
        result = S.of(context).bmi30_35;
      } else if (bmi >= 35 && bmi < 40.0) {
        result = S.of(context).bmi35_40;
      } else if (bmi >= 40) {
        result = S.of(context).bmi40;
      }
    }
    return result;
  }
}
