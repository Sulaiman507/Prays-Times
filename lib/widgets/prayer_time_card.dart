import 'package:flutter/material.dart';
import '../models/prayer_time_model.dart';
import '../utils/app_constants.dart';

class PrayerTimeCard extends StatelessWidget {
  final PrayerTime prayer;
  final bool isNext;
  final bool isCurrent;
  final bool isDark;
  final String locale;
  final TimeFormat timeFormat;
  final int index;

  const PrayerTimeCard({
    super.key,
    required this.prayer,
    required this.isNext,
    required this.isCurrent,
    required this.isDark,
    required this.locale,
    required this.timeFormat,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final name = locale == 'ar' ? prayer.nameAr : prayer.nameEn;
    final timeStr = prayer.formatTime(timeFormat);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 400 + (index * 100)),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          gradient: isNext
              ? LinearGradient(
                  colors: [
                    AppConstants.primaryGreen.withOpacity(0.9),
                    AppConstants.secondaryGreen.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : isDark
                  ? LinearGradient(
                      colors: [
                        const Color(0xFF161B22),
                        const Color(0xFF1C2333),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.95),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isNext
                  ? AppConstants.primaryGreen.withOpacity(0.3)
                  : Colors.black.withOpacity(isDark ? 0.3 : 0.08),
              blurRadius: isNext ? 20 : 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: isNext
              ? Border.all(color: AppConstants.gold.withOpacity(0.5), width: 1.5)
              : null,
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isNext
                  ? AppConstants.gold.withOpacity(0.2)
                  : AppConstants.primaryGreen.withOpacity(isDark ? 0.2 : 0.1),
            ),
            child: Icon(
              _getPrayerIcon(name),
              color: isNext ? AppConstants.gold : AppConstants.primaryGreen,
              size: 22,
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: isNext
                  ? Colors.white
                  : isDark
                      ? Colors.white
                      : AppConstants.darkText,
              fontFamily: 'Cairo',
            ),
          ),
          subtitle: isNext
              ? Text(
                  locale == 'ar' ? 'الصلاة القادمة' : 'Next Prayer',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppConstants.gold.withOpacity(0.9),
                    fontFamily: 'Cairo',
                  ),
                )
              : null,
          trailing: Text(
            timeStr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isNext
                  ? AppConstants.gold
                  : isDark
                      ? Colors.white.withOpacity(0.9)
                      : AppConstants.primaryGreen,
              fontFamily: 'Cairo',
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  IconData _getPrayerIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('فجر') || lower.contains('fajr')) return Icons.nightlight_round;
    if (lower.contains('شروق') || lower.contains('sunrise')) return Icons.wb_sunny;
    if (lower.contains('ظهر') || lower.contains('dhuhr')) return Icons.wb_cloudy;
    if (lower.contains('عصر') || lower.contains('asr')) return Icons.cloud;
    if (lower.contains('مغرب') || lower.contains('maghrib')) return Icons.wb_twilight;
    if (lower.contains('عشاء') || lower.contains('isha')) return Icons.nights_stay;
    return Icons.access_time;
  }
}
