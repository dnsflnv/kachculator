import 'dart:math';
import 'package:meta/meta.dart';

/// Body calculators.
class CalcBody {
  double weightKg;
  double heightCm;

  CalcBody({@required this.weightKg, @required this.heightCm});

  double get bmi => this.weightKg / pow((this.heightCm / 100), 2);

  String bmiInterpretation(double bmi) {
    String result = '';
    if (bmi != null) {
      if (bmi <= 16) {
        result = 'Выраженный дефицит массы тела.';
      } else if (bmi > 16 && bmi < 18.5) {
        result = 'Недостаточная (дефицит) масса тела.';
      } else if (bmi >= 18.5 && bmi < 25) {
        result = 'Нормальная масса тела.';
      } else if ((bmi >= 25) && (bmi < 30.0)) {
        result = 'Избыточная масса тела.';
      } else if (bmi >= 30 && bmi < 35.0) {
        result = 'Ожирение.';
      } else if (bmi >= 35 && bmi < 40.0) {
        result = 'Резкое ожирение.';
      } else if (bmi >= 40) {
        result = 'Очень резкое ожирение.';
      }
    }
    return result;
  }
}
