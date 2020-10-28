// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

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

  /// `Kachculator`
  String get title {
    return Intl.message(
      'Kachculator',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Body form`
  String get homePageBody {
    return Intl.message(
      'Body form',
      name: 'homePageBody',
      desc: '',
      args: [],
    );
  }

  /// `Strength and endurance`
  String get homePagePower {
    return Intl.message(
      'Strength and endurance',
      name: 'homePagePower',
      desc: '',
      args: [],
    );
  }

  /// `Body proportions`
  String get homePageProportions {
    return Intl.message(
      'Body proportions',
      name: 'homePageProportions',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get homePageFood {
    return Intl.message(
      'Food',
      name: 'homePageFood',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter you age.`
  String get ageValidation {
    return Intl.message(
      'Please, enter you age.',
      name: 'ageValidation',
      desc: '',
      args: [],
    );
  }

  /// `Use Imperial/US system (lbs, in, miles)?`
  String get useImperialUS {
    return Intl.message(
      'Use Imperial/US system (lbs, in, miles)?',
      name: 'useImperialUS',
      desc: '',
      args: [],
    );
  }

  /// `cm`
  String get cm {
    return Intl.message(
      'cm',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `in`
  String get inch {
    return Intl.message(
      'in',
      name: 'inch',
      desc: '',
      args: [],
    );
  }

  /// `Body Mass Index (BMI)`
  String get bmiPageTitle {
    return Intl.message(
      'Body Mass Index (BMI)',
      name: 'bmiPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Calculate your Body Mass Index (WHO).`
  String get bmiPageDesc {
    return Intl.message(
      'Calculate your Body Mass Index (WHO).',
      name: 'bmiPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Your weight`
  String get bmiWeight {
    return Intl.message(
      'Your weight',
      name: 'bmiWeight',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your weight.`
  String get bmiWeightValidation {
    return Intl.message(
      'Please enter your weight.',
      name: 'bmiWeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Your height`
  String get bmiHeight {
    return Intl.message(
      'Your height',
      name: 'bmiHeight',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your height.`
  String get bmiHeightValidation {
    return Intl.message(
      'Please enter your height.',
      name: 'bmiHeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get calculate {
    return Intl.message(
      'Calculate',
      name: 'calculate',
      desc: '',
      args: [],
    );
  }

  /// `BMI`
  String get bmi {
    return Intl.message(
      'BMI',
      name: 'bmi',
      desc: '',
      args: [],
    );
  }

  /// `Very severely underweight.`
  String get bmi15 {
    return Intl.message(
      'Very severely underweight.',
      name: 'bmi15',
      desc: '',
      args: [],
    );
  }

  /// `Severely underweight.`
  String get bmi15_16 {
    return Intl.message(
      'Severely underweight.',
      name: 'bmi15_16',
      desc: '',
      args: [],
    );
  }

  /// `Underweight.`
  String get bmi16_18 {
    return Intl.message(
      'Underweight.',
      name: 'bmi16_18',
      desc: '',
      args: [],
    );
  }

  /// `Normal (healthy weight).`
  String get bmi18_25 {
    return Intl.message(
      'Normal (healthy weight).',
      name: 'bmi18_25',
      desc: '',
      args: [],
    );
  }

  /// `Overweight.`
  String get bmi25_30 {
    return Intl.message(
      'Overweight.',
      name: 'bmi25_30',
      desc: '',
      args: [],
    );
  }

  /// `Obese Class I (Moderately obese).`
  String get bmi30_35 {
    return Intl.message(
      'Obese Class I (Moderately obese).',
      name: 'bmi30_35',
      desc: '',
      args: [],
    );
  }

  /// `Obese Class II (Severely obese).`
  String get bmi35_40 {
    return Intl.message(
      'Obese Class II (Severely obese).',
      name: 'bmi35_40',
      desc: '',
      args: [],
    );
  }

  /// `Obese Class III (Very severely obese).`
  String get bmi40 {
    return Intl.message(
      'Obese Class III (Very severely obese).',
      name: 'bmi40',
      desc: '',
      args: [],
    );
  }

  /// `1 RM calculation`
  String get rmPageTitle {
    return Intl.message(
      '1 RM calculation',
      name: 'rmPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `1 RM calculation by different methods.`
  String get rmPageDesc {
    return Intl.message(
      '1 RM calculation by different methods.',
      name: 'rmPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Weight of barebell`
  String get rmBarebellWeight {
    return Intl.message(
      'Weight of barebell',
      name: 'rmBarebellWeight',
      desc: '',
      args: [],
    );
  }

  /// `Repeats`
  String get rmRepeats {
    return Intl.message(
      'Repeats',
      name: 'rmRepeats',
      desc: '',
      args: [],
    );
  }

  /// `Method`
  String get rmMethod {
    return Intl.message(
      'Method',
      name: 'rmMethod',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get rmResult {
    return Intl.message(
      'Result',
      name: 'rmResult',
      desc: '',
      args: [],
    );
  }

  /// `Brzycki`
  String get Brzycki {
    return Intl.message(
      'Brzycki',
      name: 'Brzycki',
      desc: '',
      args: [],
    );
  }

  /// `Lander`
  String get Lander {
    return Intl.message(
      'Lander',
      name: 'Lander',
      desc: '',
      args: [],
    );
  }

  /// `Lombardi`
  String get Lombardi {
    return Intl.message(
      'Lombardi',
      name: 'Lombardi',
      desc: '',
      args: [],
    );
  }

  /// `Mayhew`
  String get Mayhew {
    return Intl.message(
      'Mayhew',
      name: 'Mayhew',
      desc: '',
      args: [],
    );
  }

  /// `O'Conner`
  String get OConner {
    return Intl.message(
      'O`Conner',
      name: 'OConner',
      desc: '',
      args: [],
    );
  }

  /// `Wathan`
  String get Wathan {
    return Intl.message(
      'Wathan',
      name: 'Wathan',
      desc: '',
      args: [],
    );
  }

  /// `Wilks`
  String get Wilks {
    return Intl.message(
      'Wilks',
      name: 'Wilks',
      desc: '',
      args: [],
    );
  }

  /// `Epley`
  String get Epley {
    return Intl.message(
      'Epley',
      name: 'Epley',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter weight of barebell.`
  String get rmBarebellWeightValidation {
    return Intl.message(
      'Please, enter weight of barebell.',
      name: 'rmBarebellWeightValidation',
      desc: '',
      args: [],
    );
  }

  /// `Enter repeats.`
  String get rmRepeatValidation {
    return Intl.message(
      'Enter repeats.',
      name: 'rmRepeatValidation',
      desc: '',
      args: [],
    );
  }

  /// `A body shape index (ABSI)`
  String get absiPageTitle {
    return Intl.message(
      'A body shape index (ABSI)',
      name: 'absiPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `A body shape index and mortality risk calculator.`
  String get absiPageDesc {
    return Intl.message(
      'A body shape index and mortality risk calculator.',
      name: 'absiPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Waist circumference`
  String get absiWaistCircumference {
    return Intl.message(
      'Waist circumference',
      name: 'absiWaistCircumference',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your waist circumference in cantimeters.`
  String get absiWaistCircumferenceValidation {
    return Intl.message(
      'Please enter your waist circumference in cantimeters.',
      name: 'absiWaistCircumferenceValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter you age. ABSI calculator is only for people 2 or much years old.`
  String get absiAgeValidation {
    return Intl.message(
      'Please, enter you age. ABSI calculator is only for people 2 or much years old.',
      name: 'absiAgeValidation',
      desc: '',
      args: [],
    );
  }

  /// `Premature mortality risk`
  String get absiRisk {
    return Intl.message(
      'Premature mortality risk',
      name: 'absiRisk',
      desc: '',
      args: [],
    );
  }

  /// `Very Low`
  String get absiRisk1 {
    return Intl.message(
      'Very Low',
      name: 'absiRisk1',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get absiRisk2 {
    return Intl.message(
      'Low',
      name: 'absiRisk2',
      desc: '',
      args: [],
    );
  }

  /// `Averange`
  String get absiRisk3 {
    return Intl.message(
      'Averange',
      name: 'absiRisk3',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get absiRisk4 {
    return Intl.message(
      'High',
      name: 'absiRisk4',
      desc: '',
      args: [],
    );
  }

  /// `Very High`
  String get absiRisk5 {
    return Intl.message(
      'Very High',
      name: 'absiRisk5',
      desc: '',
      args: [],
    );
  }

  /// `Averange ABSI of people in your age and same gender`
  String get absiMean {
    return Intl.message(
      'Averange ABSI of people in your age and same gender',
      name: 'absiMean',
      desc: '',
      args: [],
    );
  }

  /// `Relative fat mass (RFM)`
  String get rfmPageTitle {
    return Intl.message(
      'Relative fat mass (RFM)',
      name: 'rfmPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Relative fat mass in % calculation.`
  String get rfmPageDescription {
    return Intl.message(
      'Relative fat mass in % calculation.',
      name: 'rfmPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Body fat percentage (BFP)`
  String get bfpPageTitle {
    return Intl.message(
      'Body fat percentage (BFP)',
      name: 'bfpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Essential fat`
  String get bfpEssential {
    return Intl.message(
      'Essential fat',
      name: 'bfpEssential',
      desc: '',
      args: [],
    );
  }

  /// `Athletes`
  String get bfpAthletes {
    return Intl.message(
      'Athletes',
      name: 'bfpAthletes',
      desc: '',
      args: [],
    );
  }

  /// `Fitness`
  String get bfpFitness {
    return Intl.message(
      'Fitness',
      name: 'bfpFitness',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get bfpAverage {
    return Intl.message(
      'Average',
      name: 'bfpAverage',
      desc: '',
      args: [],
    );
  }

  /// `Obese`
  String get bfpObese {
    return Intl.message(
      'Obese',
      name: 'bfpObese',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get bfpCategory {
    return Intl.message(
      'Category',
      name: 'bfpCategory',
      desc: '',
      args: [],
    );
  }

  /// `Body proportions (McCallum)`
  String get mcPageTitle {
    return Intl.message(
      'Body proportions (McCallum)',
      name: 'mcPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ideal Body Proportions Formula For the Natural Athlete (McCallum).`
  String get mcPageDesc {
    return Intl.message(
      'Ideal Body Proportions Formula For the Natural Athlete (McCallum).',
      name: 'mcPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Body part`
  String get mcPart {
    return Intl.message(
      'Body part',
      name: 'mcPart',
      desc: '',
      args: [],
    );
  }

  /// `Wrist girth`
  String get mcWrist {
    return Intl.message(
      'Wrist girth',
      name: 'mcWrist',
      desc: '',
      args: [],
    );
  }

  /// `Enter your wrist circumference.`
  String get mcWristValidation {
    return Intl.message(
      'Enter your wrist circumference.',
      name: 'mcWristValidation',
      desc: '',
      args: [],
    );
  }

  /// `Chest girth`
  String get mcChest {
    return Intl.message(
      'Chest girth',
      name: 'mcChest',
      desc: '',
      args: [],
    );
  }

  /// `Girth of the buttocks`
  String get mcButt {
    return Intl.message(
      'Girth of the buttocks',
      name: 'mcButt',
      desc: '',
      args: [],
    );
  }

  /// `Waist`
  String get mcWaist {
    return Intl.message(
      'Waist',
      name: 'mcWaist',
      desc: '',
      args: [],
    );
  }

  /// `Thigh girth`
  String get mcThigh {
    return Intl.message(
      'Thigh girth',
      name: 'mcThigh',
      desc: '',
      args: [],
    );
  }

  /// `Neck girth`
  String get mcNeck {
    return Intl.message(
      'Neck girth',
      name: 'mcNeck',
      desc: '',
      args: [],
    );
  }

  /// `Bicep girth`
  String get mcBicep {
    return Intl.message(
      'Bicep girth',
      name: 'mcBicep',
      desc: '',
      args: [],
    );
  }

  /// `Calf circumference`
  String get mcCalf {
    return Intl.message(
      'Calf circumference',
      name: 'mcCalf',
      desc: '',
      args: [],
    );
  }

  /// `Forearm girth`
  String get mcForearm {
    return Intl.message(
      'Forearm girth',
      name: 'mcForearm',
      desc: '',
      args: [],
    );
  }

  /// `Cooper test + VO max`
  String get cooperPageTitle {
    return Intl.message(
      'Cooper test + VO max',
      name: 'cooperPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Run 12 minutes as fast, as you can. And enter the distanse in the field below. You can do it on stadium, or using fitness tracker with GPS.`
  String get cooperPageDesc {
    return Intl.message(
      'Run 12 minutes as fast, as you can. And enter the distanse in the field below. You can do it on stadium, or using fitness tracker with GPS.',
      name: 'cooperPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Excellent`
  String get cooperExcellent {
    return Intl.message(
      'Excellent',
      name: 'cooperExcellent',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get cooperGood {
    return Intl.message(
      'Good',
      name: 'cooperGood',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get cooperAverage {
    return Intl.message(
      'Average',
      name: 'cooperAverage',
      desc: '',
      args: [],
    );
  }

  /// `Bad`
  String get cooperBad {
    return Intl.message(
      'Bad',
      name: 'cooperBad',
      desc: '',
      args: [],
    );
  }

  /// `Terrible`
  String get cooperTerrible {
    return Intl.message(
      'Terrible',
      name: 'cooperTerrible',
      desc: '',
      args: [],
    );
  }

  /// `Distanse`
  String get cooperDistanse {
    return Intl.message(
      'Distanse',
      name: 'cooperDistanse',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter the distanse.`
  String get cooperDistanseValidation {
    return Intl.message(
      'Please, enter the distanse.',
      name: 'cooperDistanseValidation',
      desc: '',
      args: [],
    );
  }

  /// `Are you professional athlete?`
  String get isAthlete {
    return Intl.message(
      'Are you professional athlete?',
      name: 'isAthlete',
      desc: '',
      args: [],
    );
  }

  /// `Mark`
  String get cooperMark {
    return Intl.message(
      'Mark',
      name: 'cooperMark',
      desc: '',
      args: [],
    );
  }

  /// `Body proportions (McRobert)`
  String get mcrobertPageTitle {
    return Intl.message(
      'Body proportions (McRobert)',
      name: 'mcrobertPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ideal Body Proportions Formula For the Natural Athlete (McRobert).`
  String get mcrobertPageDesc {
    return Intl.message(
      'Ideal Body Proportions Formula For the Natural Athlete (McRobert).',
      name: 'mcrobertPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Minimum`
  String get mcrobertMin {
    return Intl.message(
      'Minimum',
      name: 'mcrobertMin',
      desc: '',
      args: [],
    );
  }

  /// `Maximum`
  String get mcrobertMax {
    return Intl.message(
      'Maximum',
      name: 'mcrobertMax',
      desc: '',
      args: [],
    );
  }

  /// `Cooper army test`
  String get cooperStrongPageTitle {
    return Intl.message(
      'Cooper army test',
      name: 'cooperStrongPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `The number of whole minutes to complete 4 cycles`
  String get cooperStrongMinutes {
    return Intl.message(
      'The number of whole minutes to complete 4 cycles',
      name: 'cooperStrongMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter number.`
  String get cooperStrongMinutesValidation {
    return Intl.message(
      'Please, enter number.',
      name: 'cooperStrongMinutesValidation',
      desc: '',
      args: [],
    );
  }

  /// `Another type of Cooper's strength endurance test, also no less common (originally created for the US military, but also used by sportsmen and military personnel of other countries, including the Russian Federation), includes 4 repetitions of the following set of exercises:\n\n - do 10 push-ups and stay in support lying;\n - leaning on our hands with a jump, we bring our legs to our hands, squatting and then back 10 times;\n - we turn on our back and put our legs behind our heads 10 times (the exercise is performed lying on our back);\n - 10 jumps with a change of legs and touching the knee to the ground.`
  String get cooperStrongPageDesc {
    return Intl.message(
      'Another type of Cooper\'s strength endurance test, also no less common (originally created for the US military, but also used by sportsmen and military personnel of other countries, including the Russian Federation), includes 4 repetitions of the following set of exercises:\n\n - do 10 push-ups and stay in support lying;\n - leaning on our hands with a jump, we bring our legs to our hands, squatting and then back 10 times;\n - we turn on our back and put our legs behind our heads 10 times (the exercise is performed lying on our back);\n - 10 jumps with a change of legs and touching the knee to the ground.',
      name: 'cooperStrongPageDesc',
      desc: '',
      args: [],
    );
  }

  /// `Lean Body Mass`
  String get lbmPageTitle {
    return Intl.message(
      'Lean Body Mass',
      name: 'lbmPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fat-free body mass.`
  String get lbmPageDescription {
    return Intl.message(
      'Fat-free body mass.',
      name: 'lbmPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `IPF Points`
  String get ifpPageTitle {
    return Intl.message(
      'IPF Points',
      name: 'ifpPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `IFP Goodlift Calculator.`
  String get ifpPageDescription {
    return Intl.message(
      'IFP Goodlift Calculator.',
      name: 'ifpPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Total weight`
  String get ifpTotalWeight {
    return Intl.message(
      'Total weight',
      name: 'ifpTotalWeight',
      desc: '',
      args: [],
    );
  }

  /// `Raw`
  String get ifpRaw {
    return Intl.message(
      'Raw',
      name: 'ifpRaw',
      desc: '',
      args: [],
    );
  }

  /// `Single-ply`
  String get ifpSingleply {
    return Intl.message(
      'Single-ply',
      name: 'ifpSingleply',
      desc: '',
      args: [],
    );
  }

  /// `3-Lift`
  String get ifp3Lift {
    return Intl.message(
      '3-Lift',
      name: 'ifp3Lift',
      desc: '',
      args: [],
    );
  }

  /// `Bench`
  String get ifpBench {
    return Intl.message(
      'Bench',
      name: 'ifpBench',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
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