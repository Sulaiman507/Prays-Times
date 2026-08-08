import 'package:flutter/material.dart';
import 'package:flutter/localizations.dart';

class AppStrings {
  final Locale locale;

  AppStrings(this.locale);

  static AppStrings of(BuildContext context) {
    return Localizations.of<AppStrings>(context, AppStrings)!;
  }

  static const LocalizationsDelegate<AppStrings> delegate = _AppStringsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'ar': {
      'appTitle': 'مواقيت الصلاة',
      'fajr': 'الفجر',
      'sunrise': 'الشروق',
      'dhuhr': 'الظهر',
      'asr': 'العصر',
      'maghrib': 'المغرب',
      'isha': 'العشاء',
      'adhan': 'أذان',
      'iqama': 'إقامة',
      'nextPrayer': 'الصلاة القادمة',
      'remaining': 'المتبقي',
      'settings': 'الإعدادات',
      'language': 'اللغة',
      'arabic': 'العربية',
      'english': 'English',
      'timeFormat': 'صيغة الوقت',
      'hour12': '12 ساعة',
      'hour24': '24 ساعة',
      'darkMode': 'الوضع الداكن',
      'light': 'فاتح',
      'dark': 'داكن',
      'system': 'النظام',
      'city': 'المدينة',
      'selectCity': 'اختر المدينة',
      'selectCountry': 'اختر الدولة',
      'today': 'اليوم',
      'hijriDate': 'التاريخ الهجري',
      'gregorianDate': 'التاريخ الميلادي',
      'minutes': 'دقيقة',
      'hours': 'ساعة',
      'calculationMethod': 'طريقة الحساب',
      'ummAlQura': 'أم القرى',
      'about': 'حول التطبيق',
      'version': 'الإصدار',
      'close': 'إغلاق',
      'search': 'بحث',
      'noResults': 'لا توجد نتائج',
      'prayerTimes': 'مواقيت الصلاة',
      'remainingTime': 'الوقت المتبقي',
      'adhanTime': 'وقت الأذان',
      'iqamaTime': 'وقت الإقامة',
    },
    'en': {
      'appTitle': 'Prayer Times',
      'fajr': 'Fajr',
      'sunrise': 'Sunrise',
      'dhuhr': 'Dhuhr',
      'asr': 'Asr',
      'maghrib': 'Maghrib',
      'isha': 'Isha',
      'adhan': 'Adhan',
      'iqama': 'Iqama',
      'nextPrayer': 'Next Prayer',
      'remaining': 'Remaining',
      'settings': 'Settings',
      'language': 'Language',
      'arabic': 'العربية',
      'english': 'English',
      'timeFormat': 'Time Format',
      'hour12': '12 Hour',
      'hour24': '24 Hour',
      'darkMode': 'Dark Mode',
      'light': 'Light',
      'dark': 'Dark',
      'system': 'System',
      'city': 'City',
      'selectCity': 'Select City',
      'selectCountry': 'Select Country',
      'today': 'Today',
      'hijriDate': 'Hijri Date',
      'gregorianDate': 'Gregorian Date',
      'minutes': 'min',
      'hours': 'hrs',
      'calculationMethod': 'Calculation Method',
      'ummAlQura': 'Umm al-Qura',
      'about': 'About',
      'version': 'Version',
      'close': 'Close',
      'search': 'Search',
      'noResults': 'No results found',
      'prayerTimes': 'Prayer Times',
      'remainingTime': 'Remaining Time',
      'adhanTime': 'Adhan Time',
      'iqamaTime': 'Iqama Time',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}

class _AppStringsDelegate extends LocalizationsDelegate<AppStrings> {
  const _AppStringsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ar', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppStrings> load(Locale locale) async {
    return AppStrings(locale);
  }

  @override
  bool shouldReload(_AppStringsDelegate old) => false;
}
