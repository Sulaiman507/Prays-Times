import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:math';

import '../providers/settings_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/prayer_calculator.dart';
import '../utils/app_constants.dart';
import '../models/prayer_time_model.dart';
import '../widgets/prayer_time_card.dart';
import '../widgets/next_prayer_widget.dart';
import '../widgets/animated_background.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideUpAnimation;
  Timer? _timer;
  PrayerTimesResult? _prayerTimes;
  int _currentPrayerIndex = -1;
  String _remainingTime = '';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _slideUpAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _animationController.forward();
    _calculatePrayerTimes();
    
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateRemainingTime();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
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
      _updateCurrentPrayer();
    });
  }

  void _updateCurrentPrayer() {
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

    _currentPrayerIndex = -1;
    for (int i = prayers.length - 1; i >= 0; i--) {
      if (now.isAfter(prayers[i]) || now.isAtSameMomentAs(prayers[i])) {
        _currentPrayerIndex = i;
        break;
      }
    }

    _updateRemainingTime();
  }

  void _updateRemainingTime() {
    if (_prayerTimes == null) return;

    final now = DateTime.now();
    final prayers = [
      _prayerTimes!.fajr,
      _
