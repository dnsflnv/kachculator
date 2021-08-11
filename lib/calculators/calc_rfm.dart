import 'package:flutter/widgets.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:meta/meta.dart';

/// RFM
/// https://www.nature.com/articles/s41598-018-29362-1
/// https://en.wikipedia.org/wiki/Body_fat_percentage#Typical_body_fat_amounts
double calcRFM(
    {required heightAthleteCm,
    required gender,
    required waistCircumferenceCm}) {
  double res = 0;
  switch (gender) {
    case Gender.female:
      res = 76.0 -
          (20.0 * ((heightAthleteCm / 100.0) / (waistCircumferenceCm / 100.0)));
      break;
    case Gender.male:
      res = 64.0 -
          (20.0 * ((heightAthleteCm / 100.0) / (waistCircumferenceCm / 100.0)));
      break;
    default:
  }
  return res;
}
