import 'package:flutter/material.dart';

class AppConstants {
  // Colors - Light Theme
  static const Color primaryGreen = Color(0xFF1B4332);
  static const Color secondaryGreen = Color(0xFF2D6A4F);
  static const Color lightGreen = Color(0xFF40916C);
  static const Color gold = Color(0xFFD4AF37);
  static const Color lightGold = Color(0xFFF4E4BA);
  static const Color cream = Color(0xFFFEFAE0);
  static const Color darkText = Color(0xFF1A1A2E);
  static const Color lightBackground = Color(0xFFF0F4F0);

  // Colors - Dark Theme
  static const Color darkBackground = Color(0xFF0D1117);
  static const Color darkCard = Color(0xFF161B22);
  static const Color darkSurface = Color(0xFF21262D);

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 300);
  static const Duration mediumAnimation = Duration(milliseconds: 500);
  static const Duration longAnimation = Duration(milliseconds: 800);

  // Prayer names
  static const List<String> prayerNamesAr = [
    'الفجر', 'الشروق', 'الظهر', 'العصر', 'المغرب', 'العشاء'
  ];

  static const List<String> prayerNamesEn = [
    'Fajr', 'Sunrise', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'
  ];

  // Iqama intervals (minutes after Adhan)
  static const Map<String, int> iqamaIntervals = {
    'fajr': 20,
    'dhuhr': 10,
    'asr': 10,
    'maghrib': 5,
    'isha': 10,
  };
}
