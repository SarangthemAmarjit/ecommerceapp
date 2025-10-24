// 🐦 Flutter imports:
import 'package:flutter/material.dart';

abstract class AppDateConfig {
  static final appFirstDate = DateTime(2000);
  static final appLastDate = DateTime(2077);

  static const appNumberOnlyDateFormat = 'dd/MM/yyyy';
  static const appMonthNameDateFormat = 'dd MMM yyyy';
}

class AppLocale {
  AppLocale._();
  static AppLocale? _instance = AppLocale._();
  factory AppLocale() => _instance ??= AppLocale._();
  void dispose() {
    _instance = null;
  }

  static String _currency = '\$';
  static String get appCurrency => _currency;
  static set currency(String value) => _currency = value;

  static Locale _defaultLocale = const Locale('en_US');
  static Locale get defaultLocale => _defaultLocale;
  static set appLocale(Locale value) => _defaultLocale = value;

     static var branchname = ['Imphal', 'Thoubal', 'Moirang'];
    static var items = ['Loan', 'Life Insurance', 'General Insurance', 'Forex'];
    // Sample monthly data
static var monthlyData = {
  '1': [
    // January
    [150, 200, 120, 100], // Imphal: Loan, Life Insurance, General Insurance, Forex
    [100, 175, 150, 80],  // Thoubal
    [75, 150, 100, 60],   // Moirang
  ],
  '2': [
    // February
    [160, 210, 130, 110], // Imphal
    [110, 180, 160, 90],  // Thoubal
    [85, 160, 110, 70],   // Moirang
  ],
  '3': [
    // March
    [170, 220, 140, 120], // Imphal
    [120, 190, 170, 100], // Thoubal
    [95, 170, 120, 80],   // Moirang
  ],
  '4': [
    // April
    [180, 230, 150, 130], // Imphal
    [130, 200, 180, 110], // Thoubal
    [105, 180, 130, 90],  // Moirang
  ],
  '5': [
    // May
    [190, 240, 160, 140], // Imphal
    [140, 210, 190, 120], // Thoubal
    [115, 190, 140, 100], // Moirang
  ],
  '6': [
    // June
    [200, 250, 170, 150], // Imphal
    [150, 220, 200, 130], // Thoubal
    [125, 200, 150, 110], // Moirang
  ],
  '7': [
    // July
    [210, 260, 180, 160], // Imphal
    [160, 230, 210, 140], // Thoubal
    [135, 210, 160, 120], // Moirang
  ],
  '8': [
    // August
    [220, 270, 190, 170], // Imphal
    [170, 240, 220, 150], // Thoubal
    [145, 220, 170, 130], // Moirang
  ],
  '9': [
    // September
    [230, 280, 200, 180], // Imphal
    [180, 250, 230, 160], // Thoubal
    [155, 230, 180, 140], // Moirang
  ],
  '10': [
    // October
    [240, 290, 210, 190], // Imphal
    [190, 260, 240, 170], // Thoubal
    [165, 240, 190, 150], // Moirang
  ],
  '11': [
    // November
    [250, 300, 220, 200], // Imphal
    [200, 270, 250, 180], // Thoubal
    [175, 250, 200, 160], // Moirang
  ],
  '12': [
    // December
    [260, 310, 230, 210], // Imphal
    [210, 280, 260, 190], // Thoubal
    [185, 260, 210, 170], // Moirang
  ],
};

}
