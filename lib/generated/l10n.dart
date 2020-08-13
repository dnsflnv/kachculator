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

  /// `Индекс массы тела (BMI)`
  String get bmiPageTitle {
    return Intl.message(
      'Индекс массы тела (BMI)',
      name: 'bmiPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Расчитайте индекс массы тела (методика ВОЗ).`
  String get bmiPageDesc {
    return Intl.message(
      'Расчитайте индекс массы тела (методика ВОЗ).',
      name: 'bmiPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Ваш вес`
  String get bmiWeight {
    return Intl.message(
      'Ваш вес',
      name: 'bmiWeight',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите ваш вес в килограммах`
  String get bmiWeightValidation {
    return Intl.message(
      'Пожалуйста, введите ваш вес в килограммах',
      name: 'bmiWeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Ваш рост`
  String get bmiHeight {
    return Intl.message(
      'Ваш рост',
      name: 'bmiHeight',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите ваш рост в сантиметрах`
  String get bmiHeightValidation {
    return Intl.message(
      'Пожалуйста, введите ваш рост в сантиметрах',
      name: 'bmiHeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Расчитать`
  String get calculate {
    return Intl.message(
      'Расчитать',
      name: 'calculate',
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

  /// `Расчёт повторного максимума по разным методикам.`
  String get rmPageDesc {
    return Intl.message(
      'Расчёт повторного максимума по разным методикам.',
      name: 'rmPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Вес снаряда`
  String get rmBarebellWeight {
    return Intl.message(
      'Вес снаряда',
      name: 'rmBarebellWeight',
      desc: '',
      args: [],
    );
  }

  /// `Количество повторов`
  String get rmRepeats {
    return Intl.message(
      'Количество повторов',
      name: 'rmRepeats',
      desc: '',
      args: [],
    );
  }

  /// `Метод`
  String get rmMethod {
    return Intl.message(
      'Метод',
      name: 'rmMethod',
      desc: '',
      args: [],
    );
  }

  /// `Результат`
  String get rmResult {
    return Intl.message(
      'Результат',
      name: 'rmResult',
      desc: '',
      args: [],
    );
  }

  /// `Мужской`
  String get male {
    return Intl.message(
      'Мужской',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Женский`
  String get female {
    return Intl.message(
      'Женский',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Бржицки`
  String get Brzycki {
    return Intl.message(
      'Бржицки',
      name: 'Brzycki',
      desc: '',
      args: [],
    );
  }

  /// `Ландер`
  String get Lander {
    return Intl.message(
      'Ландер',
      name: 'Lander',
      desc: '',
      args: [],
    );
  }

  /// `Ломбарди`
  String get Lombardi {
    return Intl.message(
      'Ломбарди',
      name: 'Lombardi',
      desc: '',
      args: [],
    );
  }

  /// `Мэхью`
  String get Mayhew {
    return Intl.message(
      'Мэхью',
      name: 'Mayhew',
      desc: '',
      args: [],
    );
  }

  /// `О'Коннор`
  String get OConner {
    return Intl.message(
      'О`Коннор',
      name: 'OConner',
      desc: '',
      args: [],
    );
  }

  /// `Ватан`
  String get Wathan {
    return Intl.message(
      'Ватан',
      name: 'Wathan',
      desc: '',
      args: [],
    );
  }

  /// `Вилкс`
  String get Wilks {
    return Intl.message(
      'Вилкс',
      name: 'Wilks',
      desc: '',
      args: [],
    );
  }

  /// `Эпли`
  String get Epley {
    return Intl.message(
      'Эпли',
      name: 'Epley',
      desc: '',
      args: [],
    );
  }

  /// `Индекс объёма тела (ABSI)`
  String get absiPageTitle {
    return Intl.message(
      'Индекс объёма тела (ABSI)',
      name: 'absiPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Расчёт индекса объёма тела.`
  String get absiPageDesc {
    return Intl.message(
      'Расчёт индекса объёма тела.',
      name: 'absiPageDesc',
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