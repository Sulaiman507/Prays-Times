import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../providers/settings_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/prayer_calculator.dart';
import '../utils/app_constants.dart';
import '../models/prayer_time_model.dart';
import '../widgets/prayer_time_card.dart';
import '../widgets/next_prayer_widget.dart';
import '../widgets/animated_background.dart';
import '../l10n/app_strings.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late Animation<double> _headerFade;
  late Animation<Offset> _headerSlide;
  Timer? _timer;
  PrayerTimesResult? _prayerTimes;
  int _nextPrayerIndex = 0;

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _headerFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _headerController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _headerSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _headerController,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _headerController.forward();
    _calculatePrayerTimes();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _headerController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _calculatePrayerTimes() {
    final settings = Provider.of<SettingsProvider>(context, listen: false);
    final calculator = PrayerCalculator(
      latitude: settings.selectedCity.latitude,
      longitude: settings.selectedCity.longitude,
      timezone: settings.selectedCity.timezone,
      date: DateTime.now(),
    );

    setState(() {
      _prayerTimes = calculator.calculate();
      _updateNextPrayer();
    });
  }

  void _updateNextPrayer() {
    if (_prayerTimes == null) return;

    final now = DateTime.now();
    final prayers = [
      _prayerTimes!.fajr,
      _prayerTimes!.sunrise,
      _prayerTimes!.dhuhr,
      _prayerTimes!.asr,
      _prayerTimes!.maghrib,
      _prayerTimes!.isha,
    ];

    _nextPrayerIndex = prayers.length;
    for (int i = 0; i < prayers.length; i++) {
      if (now.isBefore(prayers[i])) {
        _nextPrayerIndex = i;
        break;
      }
    }

    if (_nextPrayerIndex >= prayers.length) {
      _nextPrayerIndex = 0;
    }
  }

  String _getNextPrayerName(String lang) {
    final names = lang == 'ar'
        ? AppStrings.prayerNamesAr
        : AppStrings.prayerNamesEn;
    return names[_nextPrayerIndex];
  }

  DateTime _getNextPrayerTime() {
    if (_prayerTimes == null) return DateTime.now();
    final prayers = [
      _prayerTimes!.fajr,
      _prayerTimes!.sunrise,
      _prayerTimes!.dhuhr,
      _prayerTimes!.asr,
      _prayerTimes!.maghrib,
      _prayerTimes!.isha,
    ];
    return prayers[_nextPrayerIndex];
  }

  String _getFormattedDate(String lang) {
    final now = DateTime.now();
    if (lang == 'ar') {
      return '${now.day} ${_getArabicMonth(now.month)} ${now.year}';
    } else {
      return '${_getEnglishMonth(now.month)} ${now.day}, ${now.year}';
    }
  }

  String _getArabicMonth(int month) {
    const months = [
      '', 'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];
    return months[month];
  }

  String _getEnglishMonth(int month) {
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final isAr = settingsProvider.isArabic;
    final lang = isAr ? 'ar' : 'en';

    return AnimatedBackground(
      isDark: isDark,
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              _calculatePrayerTimes();
              await Future.delayed(const Duration(milliseconds: 500));
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                // Header
                FadeTransition(
                  opacity: _headerFade,
                  child: SlideTransition(
                    position: _headerSlide,
                    child: _buildHeader(context, isDark, isAr, lang),
                  ),
                ),

                // Next Prayer Widget
                if (_prayerTimes != null)
                  NextPrayerWidget(
                    nextPrayerName: _getNextPrayerName(lang),
                    nextPrayerTime: _getNextPrayerTime(),
                    isDark: isDark,
                    locale: lang,
                  ),

                // Prayer Times List
                if (_prayerTimes != null)
                  ..._buildPrayerCards(isDark, isAr, lang),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            );
          },
          backgroundColor: AppConstants.primaryGreen,
          child: const Icon(Icons.settings, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, bool isDark, bool isAr, String lang) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          // Mosque icon
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppConstants.primaryGreen,
                  AppConstants.secondaryGreen,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppConstants.primaryGreen.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.mosque,
              color: AppConstants.gold,
              size: 36,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            isAr ? 'مواقيت الصلاة' : 'Prayer Times',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : AppConstants.darkText,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on,
                  size: 16, color: AppConstants.primaryGreen),
              const SizedBox(width: 4),
              Text(
                settingsProvider.cityName,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.white70 : AppConstants.primaryGreen,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            _getFormattedDate(lang),
            style: TextStyle(
              fontSize: 13,
              color: isDark ? Colors.white54 : Colors.grey,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPrayerCards(bool isDark, bool isAr, String lang) {
    if (_prayerTimes == null) return [];

    final prayers = _prayerTimes!.getAllPrayers();
    final now = DateTime.now();

    return prayers.asMap().entries.map((entry) {
      final index = entry.key;
      final prayer = entry.value;
      final isNext = index == _nextPrayerIndex;
      final isPast = now.isAfter(prayer.time);

      return PrayerTimeCard(
        prayer: prayer,
        isNext: isNext,
        isCurrent: false,
        isDark: isDark,
        locale: lang,
        timeFormat: settingsProvider.timeFormat,
        index: index,
      );
    }).toList();
  }
}
