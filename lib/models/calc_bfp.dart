import 'package:flutter/widgets.dart';
import 'package:kachculator/models/calc.dart';
import 'package:kachculator/models/calc_bmi.dart';
import 'package:meta/meta.dart';

/// BFP
/// https://en.wikipedia.org/wiki/Body_fat_percentage
double calcBFP(
    {@required weightAthlete,
    @required heightAthleteCm,
    @required gender,
    @required age}) {
  double res = 0;
  double sex = 0.0;
  if (gender == Gender.male) sex = 1.0;

  double bmi =
      calcBmi(weightAthlete: weightAthlete, heightAthleteCm: heightAthleteCm);

  if (age <= 15.0) {
    res = (1.51 * bmi) - (0.7 * age) - (3.6 * sex) + 1.4;
  } else {
    // First formula (1991)
    //res = (1.2 * this.bmi) + (0.23 * this.age) - (10.8 * sex) - 5.4;
    // Second fomula (2002)
    res = (1.39 * bmi) + (0.16 * age) - (10.34 * sex) - 9.0;
  }
  return res;
}
