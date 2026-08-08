class PrayerTime {
  final String nameAr;
  final String nameEn;
  final DateTime time;
  final bool isAdhan;
  final bool isIqama;

  PrayerTime({
    required this.nameAr,
    required this.nameEn,
    required this.time,
    this.isAdhan = false,
    this.isIqama = false,
  });

  String getName(String locale) {
    return locale == 'ar' ? nameAr : nameEn;
  }

  String formatTime(TimeFormat format) {
    final hour = time.hour;
    final minute = time.minute;

    if (format == TimeFormat.hour24) {
      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    } else {
      final period = hour >= 12 ? 'PM' : 'AM';
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '${displayHour.toString()}:${minute.toString().padLeft(2, '0')} $period';
    }
  }
}

enum TimeFormat { hour12, hour24 }

class PrayerTimesResult {
  final DateTime fajr;
  final DateTime sunrise;
  final DateTime dhuhr;
  final DateTime asr;
  final DateTime maghrib;
  final DateTime isha;

  PrayerTimesResult({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  List<PrayerTime> getAllPrayers() {
    return [
      PrayerTime(nameAr: 'الفجر', nameEn: 'Fajr', time: fajr, isAdhan: true),
      PrayerTime(nameAr: 'الشروق', nameEn: 'Sunrise', time: sunrise),
      PrayerTime(nameAr: 'الظهر', nameEn: 'Dhuhr', time: dhuhr, isAdhan: true),
      PrayerTime(nameAr: 'العصر', nameEn: 'Asr', time: asr, isAdhan: true),
      PrayerTime(nameAr: 'المغرب', nameEn: 'Maghrib', time: maghrib, isAdhan: true),
      PrayerTime(nameAr: 'العشاء', nameEn: 'Isha', time: isha, isAdhan: true),
    ];
  }

  List<PrayerTime> getAdhanAndIqama() {
    List<PrayerTime> times = [];
    
    // Fajr
    times.add(PrayerTime(nameAr: 'أذان الفجر', nameEn: 'Fajr Adhan', time: fajr, isAdhan: true));
    times.add(PrayerTime(nameAr: 'إقامة الفجر', nameEn: 'Fajr Iqama', time: fajr.add(const Duration(minutes: 20)), isIqama: true));
    
    // Sunrise
    times.add(PrayerTime(nameAr: 'الشروق', nameEn: 'Sunrise', time: sunrise));
    
    // Dhuhr
    times.add(PrayerTime(nameAr: 'أذان الظهر', nameEn: 'Dhuhr Adhan', time: dhuhr, isAdhan: true));
    times.add(PrayerTime(nameAr: 'إقامة الظهر', nameEn: 'Dhuhr Iqama', time: dhuhr.add(const Duration(minutes: 10)), isIqama: true));
    
    // Asr
    times.add(PrayerTime(nameAr: 'أذان العصر', nameEn: 'Asr Adhan', time: asr, isAdhan: true));
    times.add(PrayerTime(nameAr: 'إقامة العصر', nameEn: 'Asr Iqama', time: asr.add(const Duration(minutes: 10)), isIqama: true));
    
    // Maghrib
    times.add(PrayerTime(nameAr: 'أذان المغرب', nameEn: 'Maghrib Adhan', time: maghrib, isAdhan: true));
    times.add(PrayerTime(nameAr: 'إقامة المغرب', nameEn: 'Maghrib Iqama', time: maghrib.add(const Duration(minutes: 5)), isIqama: true));
    
    // Isha
    times.add(PrayerTime(nameAr: 'أذان العشاء', nameEn: 'Isha Adhan', time: isha, isAdhan: true));
    times.add(PrayerTime(nameAr: 'إقامة العشاء', nameEn: 'Isha Iqama', time: isha.add(const Duration(minutes: 10)), isIqama: true));
    
    return times;
  }
}
