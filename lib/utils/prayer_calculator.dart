import 'dart:math';
import '../models/prayer_time_model.dart';

/// Prayer times calculator using Umm al-Qura method
/// All calculations are done locally without internet
class PrayerCalculator {
  final double latitude;
  final double longitude;
  final double timezone;
  final DateTime date;

  // Umm al-Qura parameters
  static const double fajrAngle = 18.5;
  static const double ishaInterval = 90; // minutes after Maghrib

  PrayerCalculator({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.date,
  });

  PrayerTimesResult calculate() {
    final jd = _julianDay(date.year, date.month, date.day);
    final sunPos = _sunPosition(jd);
    final declination = sunPos.declination;
    final equationOfTime = sunPos.equationOfTime;

    // Calculate transit time (Dhuhr)
    final transit = 12.0 + timezone - longitude / 15.0 - equationOfTime;

    // Calculate sunrise and sunset
    final hourAngleSunrise = _hourAngle(declination, 0.8333);
    final sunrise = transit - hourAngleSunrise;
    final sunset = transit + hourAngleSunrise;

    // Calculate Fajr (18.5 degrees below horizon)
    final hourAngleFajr = _hourAngle(declination, fajrAngle);
    final fajr = transit - hourAngleFajr;

    // Calculate Asr (Shafi'i - shadow equals object length)
    final asrAngle =
        atan(1.0 / (1.0 + tan((latitude - declination) * pi / 180))) *
            180 /
            pi;
    final hourAngleAsr = _hourAngle(declination, asrAngle);
    final asr = transit + hourAngleAsr;

    // Maghrib = Sunset
    final maghrib = sunset;

    // Isha = Maghrib + 90 minutes (Umm al-Qura)
    final isha = maghrib + ishaInterval / 60.0;

    return PrayerTimesResult(
      fajr: _decimalToDateTime(fajr),
      sunrise: _decimalToDateTime(sunrise),
      dhuhr: _decimalToDateTime(transit),
      asr: _decimalToDateTime(asr),
      maghrib: _decimalToDateTime(maghrib),
      isha: _decimalToDateTime(isha),
    );
  }

  double _hourAngle(double declination, double angle) {
    final latRad = latitude * pi / 180.0;
    final decRad = declination * pi / 180.0;
    final angleRad = angle * pi / 180.0;

    final cosHA = (sin(angleRad) - sin(latRad) * sin(decRad)) /
        (cos(latRad) * cos(decRad));

    if (cosHA > 1.0) return 0.0;
    if (cosHA < -1.0) return pi;

    return acos(cosHA) * 180.0 / pi / 15.0;
  }

  DateTime _decimalToDateTime(double hours) {
    hours = hours % 24;
    if (hours < 0) hours += 24;

    final h = hours.floor();
    final m = ((hours - h) * 60).floor();
    final s = ((((hours - h) * 60) - m) * 60).floor();

    return DateTime(date.year, date.month, date.day, h, m, s);
  }

  double _julianDay(int year, int month, int day) {
    if (month <= 2) {
      year -= 1;
      month += 12;
    }
    final a = (year / 100).floor();
    final b = 2 - a + (a / 4).floor();
    return (365.25 * (year + 4716)).floor() +
        (30.6001 * (month + 1)).floor() +
        day +
        b -
        1524.5;
  }

  _SunPosition _sunPosition(double jd) {
    final d = jd - 2451545.0;

    // Mean anomaly
    final g = (357.529 + 0.98560028 * d) % 360;
    final gRad = g * pi / 180.0;

    // Mean longitude
    final q = (280.459 + 0.98564736 * d) % 360;

    // Ecliptic longitude
    final l = (q + 1.915 * sin(gRad) + 0.020 * sin(2 * gRad)) % 360;
    final lRad = l * pi / 180.0;

    // Obliquity of ecliptic
    final e = 23.439 - 0.00000036 * d;
    final eRad = e * pi / 180.0;

    // Declination
    final dec = asin(sin(eRad) * sin(lRad)) * 180.0 / pi;

    // Right ascension
    final ra = atan2(cos(eRad) * sin(lRad), cos(lRad)) * 180.0 / pi;

    // Equation of time
    double eqTime = q / 15.0 - (ra / 15.0 + (ra < 0 ? 24.0 : 0.0));
    if (eqTime > 12.0) eqTime -= 24.0;
    if (eqTime < -12.0) eqTime += 24.0;

    return _SunPosition(declination: dec, equationOfTime: eqTime);
  }
}

class _SunPosition {
  final double declination;
  final double equationOfTime;

  _SunPosition({
    required this.declination,
    required this.equationOfTime,
  });
}
