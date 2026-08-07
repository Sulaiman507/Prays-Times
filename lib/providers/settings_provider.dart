import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/prayer_time_model.dart';
import '../utils/cities_data.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _langKey = 'language';
  static const String _timeFormatKey = 'time_format';
  static const String _cityLatKey = 'city_lat';
  static const String _cityLngKey = 'city_lng';
  static const String _cityTzKey = 'city_tz';
  static const String _cityNameArKey = 'city_name_ar';
  static const String _cityNameEnKey = 'city_name_en';

  final SharedPreferences prefs;

  SettingsProvider({required this.prefs}) {
    _loadSettings();
  }

  String _language = 'ar';
  TimeFormat _timeFormat = TimeFormat.hour12;
  City _selectedCity = CitiesData.getAllCities().first; // Makkah default

  String get language => _language;
  TimeFormat get timeFormat => _timeFormat;
  City get selectedCity => _selectedCity;
  Locale get locale => Locale(_language);
  bool get isArabic => _language == 'ar';

  void _loadSettings() {
    _language = prefs.getString(_langKey) ?? 'ar';

    final formatIndex = prefs.getInt(_timeFormatKey) ?? 0;
    _timeFormat = formatIndex == 0 ? TimeFormat.hour12 : TimeFormat.hour24;

    final lat = prefs.getDouble(_cityLatKey);
    final lng = prefs.getDouble(_cityLngKey);
    final tz = prefs.getDouble(_cityTzKey);

    if (lat != null && lng != null && tz != null) {
      _selectedCity = City(
        nameAr: prefs.getString(_cityNameArKey) ?? 'مكة المكرمة',
        nameEn: prefs.getString(_cityNameEnKey) ?? 'Makkah',
        countryAr: '',
        countryEn: '',
        latitude: lat,
        longitude: lng,
        timezone: tz,
      );
    }
  }

  void setLanguage(String lang) {
    _language = lang;
    prefs.setString(_langKey, lang);
    notifyListeners();
  }

  void toggleTimeFormat() {
    _timeFormat =
        _timeFormat == TimeFormat.hour12 ? TimeFormat.hour24 : TimeFormat.hour12;
    prefs.setInt(_timeFormatKey, _timeFormat == TimeFormat.hour12 ? 0 : 1);
    notifyListeners();
  }

  void setTimeFormat(TimeFormat format) {
    _timeFormat = format;
    prefs.setInt(_timeFormatKey, format == TimeFormat.hour12 ? 0 : 1);
    notifyListeners();
  }

  void setCity(City city) {
    _selectedCity = city;
    prefs.setDouble(_cityLatKey, city.latitude);
    prefs.setDouble(_cityLngKey, city.longitude);
    prefs.setDouble(_cityTzKey, city.timezone);
    prefs.setString(_cityNameArKey, city.nameAr);
    prefs.setString(_cityNameEnKey, city.nameEn);
    notifyListeners();
  }

  String get cityName =>
      _language == 'ar' ? _selectedCity.nameAr : _selectedCity.nameEn;
}
