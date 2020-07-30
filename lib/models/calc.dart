import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:kachculator/generated/l10n.dart';
import 'package:meta/meta.dart';

enum Gender { male, female }
enum Coeff { a, b, c, d, e, f }

class Calc {
  BuildContext context; // For localization
  double weightAthlete;
  double heightAthleteCm;

  int repeat;
  double weight;
  Gender gender;

  /// BMI calculation constructor
  Calc.bmi(
      {@required this.weightAthlete,
      @required this.heightAthleteCm,
      @required this.context});

  double get bmi => this.weightAthlete / pow((this.heightAthleteCm / 100), 2);

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

  /// 1RM Constructor
  Calc.rm(
      {@required context,
      @required this.weightAthlete,
      @required this.weight,
      @required this.repeat,
      @required this.gender});

  double get oneRmEpley => (this.repeat * this.weight) / 30.0 + this.weight;
  double get oneRmBrzycki => this.weight * (36.0 / (37.0 - this.repeat));
  double get oneRmLander =>
      (100 * this.weight) / (101.3 - 2.67123 * this.repeat);
  double get oneRmLombardi => this.weight * pow(this.repeat, 0.1);
  double get oneRmMayhew => (100 * this.weight) / (52.2 + 41.9 * 7.01863E-06);
  double get oneRmOConner => this.weight * (1 + 0.025 * this.repeat);
  double get oneRmWathan => 100 * this.weight / (48.8 + 53.8);

  Map<Gender, Map<Coeff, double>> coeff = {
    Gender.male: {
      Coeff.a: -216.0475144,
      Coeff.b: 16.2606339,
      Coeff.c: -0.002388645,
      Coeff.d: -0.00113732,
      Coeff.e: 7.01863E-06,
      Coeff.f: -1.291E-08
    },
    Gender.female: {
      Coeff.a: 594.31747775582,
      Coeff.b: -27.23842536447,
      Coeff.c: 0.82112226871,
      Coeff.d: -0.00930733913,
      Coeff.e: 0.00004731582,
      Coeff.f: -0.00000009054
    }
  };
  double get oneRmWilks {
    Map<Coeff, double> c = coeff[this.gender];
    double result = (500.0 * weight) /
        (c[Coeff.a] +
            c[Coeff.b] * this.weightAthlete +
            c[Coeff.c] * pow(this.weightAthlete, 2) +
            c[Coeff.d] * pow(this.weightAthlete, 3) +
            c[Coeff.e] * pow(this.weightAthlete, 4) +
            c[Coeff.f] * pow(this.weightAthlete, 5));
    return result;
  }
}
