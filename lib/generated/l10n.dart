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

  /// `Физическая форма`
  String get homePageBody {
    return Intl.message(
      'Физическая форма',
      name: 'homePageBody',
      desc: '',
      args: [],
    );
  }

  /// `Сила и выносливость`
  String get homePagePower {
    return Intl.message(
      'Сила и выносливость',
      name: 'homePagePower',
      desc: '',
      args: [],
    );
  }

  /// `Пропорции тела`
  String get homePageProportions {
    return Intl.message(
      'Пропорции тела',
      name: 'homePageProportions',
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

  /// `О приложении`
  String get about {
    return Intl.message(
      'О приложении',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Пол`
  String get gender {
    return Intl.message(
      'Пол',
      name: 'gender',
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

  /// `Возраст`
  String get age {
    return Intl.message(
      'Возраст',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите возраст.`
  String get ageValidation {
    return Intl.message(
      'Пожалуйста, введите возраст.',
      name: 'ageValidation',
      desc: '',
      args: [],
    );
  }

  /// `Использовать английскую систему мер (фунты, дюймы, мили)?`
  String get useImperialUS {
    return Intl.message(
      'Использовать английскую систему мер (фунты, дюймы, мили)?',
      name: 'useImperialUS',
      desc: '',
      args: [],
    );
  }

  /// `см`
  String get cm {
    return Intl.message(
      'см',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `дюймы`
  String get inch {
    return Intl.message(
      'дюймы',
      name: 'inch',
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

  /// `Пожалуйста, введите ваш вес`
  String get bmiWeightValidation {
    return Intl.message(
      'Пожалуйста, введите ваш вес',
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

  /// `Пожалуйста, введите ваш рост`
  String get bmiHeightValidation {
    return Intl.message(
      'Пожалуйста, введите ваш рост',
      name: 'bmiHeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Рассчитать`
  String get calculate {
    return Intl.message(
      'Рассчитать',
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

  /// `Избыточная масса тела (1 степень).`
  String get bmi25_30 {
    return Intl.message(
      'Избыточная масса тела (1 степень).',
      name: 'bmi25_30',
      desc: '',
      args: [],
    );
  }

  /// `Ожирение (2a степень).`
  String get bmi30_35 {
    return Intl.message(
      'Ожирение (2a степень).',
      name: 'bmi30_35',
      desc: '',
      args: [],
    );
  }

  /// `Выраженное ожирение (2b степень).`
  String get bmi35_40 {
    return Intl.message(
      'Выраженное ожирение (2b степень).',
      name: 'bmi35_40',
      desc: '',
      args: [],
    );
  }

  /// `Резко выраженное, морбидное ожирение (3 степень).`
  String get bmi40 {
    return Intl.message(
      'Резко выраженное, морбидное ожирение (3 степень).',
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

  /// `Введите вес снаряда.`
  String get rmBarebellWeightValidation {
    return Intl.message(
      'Введите вес снаряда.',
      name: 'rmBarebellWeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Введите количество повторов.`
  String get rmRepeatValidation {
    return Intl.message(
      'Введите количество повторов.',
      name: 'rmRepeatValidation',
      desc: '',
      args: [],
    );
  }

  /// `Индекс формы тела (ABSI)`
  String get absiPageTitle {
    return Intl.message(
      'Индекс формы тела (ABSI)',
      name: 'absiPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Расчёт индекса формы тела и риска преждевременной смерти.`
  String get absiPageDesc {
    return Intl.message(
      'Расчёт индекса формы тела и риска преждевременной смерти.',
      name: 'absiPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Объём талии`
  String get absiWaistCircumference {
    return Intl.message(
      'Объём талии',
      name: 'absiWaistCircumference',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите окружность талии.`
  String get absiWaistCircumferenceValidation {
    return Intl.message(
      'Пожалуйста, введите окружность талии.',
      name: 'absiWaistCircumferenceValidation',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите возраст. Можно расчитать ABSI только для людей, старше 2 лет.`
  String get absiAgeValidation {
    return Intl.message(
      'Пожалуйста, введите возраст. Можно расчитать ABSI только для людей, старше 2 лет.',
      name: 'absiAgeValidation',
      desc: '',
      args: [],
    );
  }

  /// `Риск преждевременной смерти`
  String get absiRisk {
    return Intl.message(
      'Риск преждевременной смерти',
      name: 'absiRisk',
      desc: '',
      args: [],
    );
  }

  /// `Очень низкий.`
  String get absiRisk1 {
    return Intl.message(
      'Очень низкий.',
      name: 'absiRisk1',
      desc: '',
      args: [],
    );
  }

  /// `Низкий.`
  String get absiRisk2 {
    return Intl.message(
      'Низкий.',
      name: 'absiRisk2',
      desc: '',
      args: [],
    );
  }

  /// `Средний.`
  String get absiRisk3 {
    return Intl.message(
      'Средний.',
      name: 'absiRisk3',
      desc: '',
      args: [],
    );
  }

  /// `Высокий.`
  String get absiRisk4 {
    return Intl.message(
      'Высокий.',
      name: 'absiRisk4',
      desc: '',
      args: [],
    );
  }

  /// `Очень выскокий.`
  String get absiRisk5 {
    return Intl.message(
      'Очень выскокий.',
      name: 'absiRisk5',
      desc: '',
      args: [],
    );
  }

  /// `Средний ABSI людей вашего пола и возраста`
  String get absiMean {
    return Intl.message(
      'Средний ABSI людей вашего пола и возраста',
      name: 'absiMean',
      desc: '',
      args: [],
    );
  }

  /// `Относительная масса жира (RFM)`
  String get rfmPageTitle {
    return Intl.message(
      'Относительная масса жира (RFM)',
      name: 'rfmPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Расчёт относительной массы жира в процентах.`
  String get rfmPageDescription {
    return Intl.message(
      'Расчёт относительной массы жира в процентах.',
      name: 'rfmPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Процент жира в теле (BFP)`
  String get bfpPageTitle {
    return Intl.message(
      'Процент жира в теле (BFP)',
      name: 'bfpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Необходимый жир`
  String get bfpEssential {
    return Intl.message(
      'Необходимый жир',
      name: 'bfpEssential',
      desc: '',
      args: [],
    );
  }

  /// `Атлеты`
  String get bfpAthletes {
    return Intl.message(
      'Атлеты',
      name: 'bfpAthletes',
      desc: '',
      args: [],
    );
  }

  /// `Фитнесс`
  String get bfpFitness {
    return Intl.message(
      'Фитнесс',
      name: 'bfpFitness',
      desc: '',
      args: [],
    );
  }

  /// `Средний`
  String get bfpAverage {
    return Intl.message(
      'Средний',
      name: 'bfpAverage',
      desc: '',
      args: [],
    );
  }

  /// `Ожирение`
  String get bfpObese {
    return Intl.message(
      'Ожирение',
      name: 'bfpObese',
      desc: '',
      args: [],
    );
  }

  /// `Категория`
  String get bfpCategory {
    return Intl.message(
      'Категория',
      name: 'bfpCategory',
      desc: '',
      args: [],
    );
  }

  /// `Пропорции тела (МакКаллум)`
  String get mcPageTitle {
    return Intl.message(
      'Пропорции тела (МакКаллум)',
      name: 'mcPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Часть тела`
  String get mcPart {
    return Intl.message(
      'Часть тела',
      name: 'mcPart',
      desc: '',
      args: [],
    );
  }

  /// `Расчёт идеальных пропорций тела по МакКаллуму для натурального бодибилдера.`
  String get mcPageDesc {
    return Intl.message(
      'Расчёт идеальных пропорций тела по МакКаллуму для натурального бодибилдера.',
      name: 'mcPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Обхват запястья`
  String get mcWrist {
    return Intl.message(
      'Обхват запястья',
      name: 'mcWrist',
      desc: '',
      args: [],
    );
  }

  /// `Введите обхват запястья.`
  String get mcWristValidation {
    return Intl.message(
      'Введите обхват запястья.',
      name: 'mcWristValidation',
      desc: '',
      args: [],
    );
  }

  /// `Обхват груди`
  String get mcChest {
    return Intl.message(
      'Обхват груди',
      name: 'mcChest',
      desc: '',
      args: [],
    );
  }

  /// `Обхват ягодиц`
  String get mcButt {
    return Intl.message(
      'Обхват ягодиц',
      name: 'mcButt',
      desc: '',
      args: [],
    );
  }

  /// `Обхват талии`
  String get mcWaist {
    return Intl.message(
      'Обхват талии',
      name: 'mcWaist',
      desc: '',
      args: [],
    );
  }

  /// `Обхват бедра`
  String get mcThigh {
    return Intl.message(
      'Обхват бедра',
      name: 'mcThigh',
      desc: '',
      args: [],
    );
  }

  /// `Обхват шеи`
  String get mcNeck {
    return Intl.message(
      'Обхват шеи',
      name: 'mcNeck',
      desc: '',
      args: [],
    );
  }

  /// `Обхват бицепса`
  String get mcBicep {
    return Intl.message(
      'Обхват бицепса',
      name: 'mcBicep',
      desc: '',
      args: [],
    );
  }

  /// `Обхват голени`
  String get mcCalf {
    return Intl.message(
      'Обхват голени',
      name: 'mcCalf',
      desc: '',
      args: [],
    );
  }

  /// `Обхват предплечья`
  String get mcForearm {
    return Intl.message(
      'Обхват предплечья',
      name: 'mcForearm',
      desc: '',
      args: [],
    );
  }

  /// `Тест Купера + VO max`
  String get cooperPageTitle {
    return Intl.message(
      'Тест Купера + VO max',
      name: 'cooperPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Тест на физическую подготовку, применяется в армии США. Для прохождения придётся побегать. Найдите стадион или беговую дорожку с отмеченным расстоянием (или используйте фитнесс-трекер с GPS) и замерьте, какое расстояние вы пробегаете за 12 минут непрерывного бега с максимально возможным для Вас усилием. Перед выполнением теста проконсультируйтесь с врачом, особенно, если у вас проблемы с сердечно-сосудистой системой.`
  String get cooperPageDesc {
    return Intl.message(
      'Тест на физическую подготовку, применяется в армии США. Для прохождения придётся побегать. Найдите стадион или беговую дорожку с отмеченным расстоянием (или используйте фитнесс-трекер с GPS) и замерьте, какое расстояние вы пробегаете за 12 минут непрерывного бега с максимально возможным для Вас усилием. Перед выполнением теста проконсультируйтесь с врачом, особенно, если у вас проблемы с сердечно-сосудистой системой.',
      name: 'cooperPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Отлично`
  String get cooperExcellent {
    return Intl.message(
      'Отлично',
      name: 'cooperExcellent',
      desc: '',
      args: [],
    );
  }

  /// `Хорошо`
  String get cooperGood {
    return Intl.message(
      'Хорошо',
      name: 'cooperGood',
      desc: '',
      args: [],
    );
  }

  /// `Удовлетворительно`
  String get cooperAverage {
    return Intl.message(
      'Удовлетворительно',
      name: 'cooperAverage',
      desc: '',
      args: [],
    );
  }

  /// `Плохо`
  String get cooperBad {
    return Intl.message(
      'Плохо',
      name: 'cooperBad',
      desc: '',
      args: [],
    );
  }

  /// `Ужасно`
  String get cooperTerrible {
    return Intl.message(
      'Ужасно',
      name: 'cooperTerrible',
      desc: '',
      args: [],
    );
  }

  /// `Дистанция`
  String get cooperDistanse {
    return Intl.message(
      'Дистанция',
      name: 'cooperDistanse',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите дистанцию.`
  String get cooperDistanseValidation {
    return Intl.message(
      'Пожалуйста, введите дистанцию.',
      name: 'cooperDistanseValidation',
      desc: '',
      args: [],
    );
  }

  /// `Вы профессиональный спортсмен?`
  String get isAthlete {
    return Intl.message(
      'Вы профессиональный спортсмен?',
      name: 'isAthlete',
      desc: '',
      args: [],
    );
  }

  /// `Оценка`
  String get cooperMark {
    return Intl.message(
      'Оценка',
      name: 'cooperMark',
      desc: '',
      args: [],
    );
  }

  /// `Пропорциии тела (МакРоберт)`
  String get mcrobertPageTitle {
    return Intl.message(
      'Пропорциии тела (МакРоберт)',
      name: 'mcrobertPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Расчёт идеальных пропорций тела по МакРоберту для натурального бодибилдера.`
  String get mcrobertPageDesc {
    return Intl.message(
      'Расчёт идеальных пропорций тела по МакРоберту для натурального бодибилдера.',
      name: 'mcrobertPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Минимум`
  String get mcrobertMin {
    return Intl.message(
      'Минимум',
      name: 'mcrobertMin',
      desc: '',
      args: [],
    );
  }

  /// `Максимум`
  String get mcrobertMax {
    return Intl.message(
      'Максимум',
      name: 'mcrobertMax',
      desc: '',
      args: [],
    );
  }

  /// `Тест Купера на силовую выносливость`
  String get cooperStrongPageTitle {
    return Intl.message(
      'Тест Купера на силовую выносливость',
      name: 'cooperStrongPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Количество целых минут на выполнение 4-х циклов`
  String get cooperStrongMinutes {
    return Intl.message(
      'Количество целых минут на выполнение 4-х циклов',
      name: 'cooperStrongMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, введите число.`
  String get cooperStrongMinutesValidation {
    return Intl.message(
      'Пожалуйста, введите число.',
      name: 'cooperStrongMinutesValidation',
      desc: '',
      args: [],
    );
  }

  /// `Ещё один вид теста Купера на силовую выносливость, также не менее распространенный (изначально созданный для военнослужащих армии США, но также используемый спорстменами и военнослужащими других стран, включая РФ), включает в себя 4 повтора следующего комплекса упражнений:\n\n – делаем 10 отжиманий и остаёмся в упоре лёжа;\n – опираясь на руки прыжком ноги подносим к рукам в упор присев и потом обратно 10 раз;\n – переворачиваемся на спину и 10 раз вынос ног за голову (упражнение выполняется лёжа на спине);\n – 10 подпрыгиваний со сменой ног и касаясь коленом земли.`
  String get cooperStrongPageDesc {
    return Intl.message(
      'Ещё один вид теста Купера на силовую выносливость, также не менее распространенный (изначально созданный для военнослужащих армии США, но также используемый спорстменами и военнослужащими других стран, включая РФ), включает в себя 4 повтора следующего комплекса упражнений:\n\n – делаем 10 отжиманий и остаёмся в упоре лёжа;\n – опираясь на руки прыжком ноги подносим к рукам в упор присев и потом обратно 10 раз;\n – переворачиваемся на спину и 10 раз вынос ног за голову (упражнение выполняется лёжа на спине);\n – 10 подпрыгиваний со сменой ног и касаясь коленом земли.',
      name: 'cooperStrongPageDesc',
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