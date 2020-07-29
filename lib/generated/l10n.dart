// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Качкулятор`
  String get title {
    return Intl.message(
      'Качкулятор',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Измерения тела`
  String get homePageBody {
    return Intl.message(
      'Измерения тела',
      name: 'homePageBody',
      desc: '',
      args: [],
    );
  }

  /// `Сила`
  String get homePagePower {
    return Intl.message(
      'Сила',
      name: 'homePagePower',
      desc: '',
      args: [],
    );
  }

  /// `Еда`
  String get homePageFood {
    return Intl.message(
      'Еда',
      name: 'homePageFood',
      desc: '',
      args: [],
    );
  }

  /// `Индекс массы тела`
  String get bmiPageTitle {
    return Intl.message(
      'Индекс массы тела',
      name: 'bmiPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Расчитайте индекс массы тела (ВОЗ).`
  String get bmiPageDesc {
    return Intl.message(
      'Расчитайте индекс массы тела (ВОЗ).',
      name: 'bmiPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Вес`
  String get bmiWeight {
    return Intl.message(
      'Вес',
      name: 'bmiWeight',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите вес в килограммах`
  String get bmiWeightValidation {
    return Intl.message(
      'Пожалуйста, введите вес в килограммах',
      name: 'bmiWeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Рост`
  String get bmiHeight {
    return Intl.message(
      'Рост',
      name: 'bmiHeight',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите рост в сантиметрах`
  String get bmiHeightValidation {
    return Intl.message(
      'Пожалуйста, введите рост в сантиметрах',
      name: 'bmiHeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Расчитать`
  String get bmiCalculate {
    return Intl.message(
      'Расчитать',
      name: 'bmiCalculate',
      desc: '',
      args: [],
    );
  }

  /// `ИМТ`
  String get bmi {
    return Intl.message(
      'ИМТ',
      name: 'bmi',
      desc: '',
      args: [],
    );
  }

  /// `Выраженный дефицит массы тела.`
  String get bmi15 {
    return Intl.message(
      'Выраженный дефицит массы тела.',
      name: 'bmi15',
      desc: '',
      args: [],
    );
  }

  /// `Дефицит массы тела.`
  String get bmi15_16 {
    return Intl.message(
      'Дефицит массы тела.',
      name: 'bmi15_16',
      desc: '',
      args: [],
    );
  }

  /// `Недостаточная (дефицит) масса тела.`
  String get bmi16_18 {
    return Intl.message(
      'Недостаточная (дефицит) масса тела.',
      name: 'bmi16_18',
      desc: '',
      args: [],
    );
  }

  /// `Нормальная масса тела.`
  String get bmi18_25 {
    return Intl.message(
      'Нормальная масса тела.',
      name: 'bmi18_25',
      desc: '',
      args: [],
    );
  }

  /// `Избыточная масса тела.`
  String get bmi25_30 {
    return Intl.message(
      'Избыточная масса тела.',
      name: 'bmi25_30',
      desc: '',
      args: [],
    );
  }

  /// `Ожирение.`
  String get bmi30_35 {
    return Intl.message(
      'Ожирение.',
      name: 'bmi30_35',
      desc: '',
      args: [],
    );
  }

  /// `Резкое ожирение.`
  String get bmi35_40 {
    return Intl.message(
      'Резкое ожирение.',
      name: 'bmi35_40',
      desc: '',
      args: [],
    );
  }

  /// `Очень резкое ожирение.`
  String get bmi40 {
    return Intl.message(
      'Очень резкое ожирение.',
      name: 'bmi40',
      desc: '',
      args: [],
    );
  }

  /// `Повторный максимум`
  String get rmPageTitle {
    return Intl.message(
      'Повторный максимум',
      name: 'rmPageTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}