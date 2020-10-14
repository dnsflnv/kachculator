import 'package:flutter/widgets.dart';
import 'package:kachculator/calculators/calc.dart';
import 'package:meta/meta.dart';

/// LBM Boer
/// https://en.wikipedia.org/wiki/Lean_body_mass
double calcLbmBoer({@required weight, @required gender, @required heightCm}) {
  double res = 0;
  switch (gender) {
    case Gender.female:
      res = (0.252 * weight) + (0.473 * heightCm) - 48.3;
      break;
    case Gender.male:
      res = (0.407 * weight) + (0.267 * heightCm) - 19.2;
      break;
    default:
  }
  return res;
}

/// LBM Hume
/// https://en.wikipedia.org/wiki/Lean_body_mass
double calcLbmHume({@required weight, @required gender, @required heightCm}) {
  double res = 0;
  switch (gender) {
    case Gender.female:
      res = (0.29569 * weight) + (0.41813 * heightCm) - 43.2933;
      break;
    case Gender.male:
      res = (0.32810 * weight) + (0.33929 * heightCm) - 29.5336;
      break;
    default:
  }
  return res;
}
