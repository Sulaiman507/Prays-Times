class City {
  final String nameAr;
  final String nameEn;
  final String countryAr;
  final String countryEn;
  final double latitude;
  final double longitude;
  final double timezone;

  City({
    required this.nameAr,
    required this.nameEn,
    required this.countryAr,
    required this.countryEn,
    required this.latitude,
    required this.longitude,
    required this.timezone,
  });
}

class CitiesData {
  static List<City> getAllCities() {
    return [
      // Saudi Arabia
      City(nameAr: 'مكة المكرمة', nameEn: 'Makkah', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 21.3891, longitude: 39.8579, timezone: 3),
      City(nameAr: 'المدينة المنورة', nameEn: 'Madinah', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 24.4672, longitude: 39.6024, timezone: 3),
      City(nameAr: 'الرياض', nameEn: 'Riyadh', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 24.7136, longitude: 46.6753, timezone: 3),
      City(nameAr: 'جدة', nameEn: 'Jeddah', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 21.5433, longitude: 39.1728, timezone: 3),
      City(nameAr: 'الدمام', nameEn: 'Dammam', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 26.4207, longitude: 50.0888, timezone: 3),
      City(nameAr: 'أبها', nameEn: 'Abha', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 18.2164, longitude: 42.5053, timezone: 3),
      City(nameAr: 'تبوك', nameEn: 'Tabuk', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 28.3838, longitude: 36.5550, timezone: 3),
      City(nameAr: 'الطائف', nameEn: 'Taif', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 21.2703, longitude: 40.4158, timezone: 3),
      City(nameAr: 'بريدة', nameEn: 'Buraydah', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 26.3289, longitude: 43.9750, timezone: 3),
      City(nameAr: 'حائل', nameEn: "Ha'il", countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 27.5114, longitude: 41.6956, timezone: 3),
      City(nameAr: 'نجران', nameEn: 'Najran', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 17.4933, longitude: 44.1322, timezone: 3),
      City(nameAr: 'جازان', nameEn: 'Jazan', countryAr: 'السعودية', countryEn: 'Saudi Arabia', latitude: 16.8892, longitude: 42.5611, timezone: 3),

      // Egypt
      City(nameAr: 'القاهرة', nameEn: 'Cairo', countryAr: 'مصر', countryEn: 'Egypt', latitude: 30.0444, longitude: 31.2357, timezone: 2),
      City(nameAr: 'الإسكندرية', nameEn: 'Alexandria', countryAr: 'مصر', countryEn: 'Egypt', latitude: 31.2001, longitude: 29.9187, timezone: 2),
      City(nameAr: 'الأقصر', nameEn: 'Luxor', countryAr: 'مصر', countryEn: 'Egypt', latitude: 25.6872, longitude: 32.6396, timezone: 2),
      City(nameAr: 'أسوان', nameEn: 'Aswan', countryAr: 'مصر', countryEn: 'Egypt', latitude: 24.0889, longitude: 32.8998, timezone: 2),
      City(nameAr: 'المنصورة', nameEn: 'Mansoura', countryAr: 'مصر', countryEn: 'Egypt', latitude: 31.0409, longitude: 31.3785, timezone: 2),
      City(nameAr: 'طنطا', nameEn: 'Tanta', countryAr: 'مصر', countryEn: 'Egypt', latitude: 30.7865, longitude: 31.0004, timezone: 2),

      // UAE
      City(nameAr: 'دبي', nameEn: 'Dubai', countryAr: 'الإمارات', countryEn: 'UAE', latitude: 25.2048, longitude: 55.2708, timezone: 4),
      City(nameAr: 'أبوظبي', nameEn: 'Abu Dhabi', countryAr: 'الإمارات', countryEn: 'UAE', latitude: 24.4539, longitude: 54.3773, timezone: 4),
      City(nameAr: 'الشارقة', nameEn: 'Sharjah', countryAr: 'الإمارات', countryEn: 'UAE', latitude: 25.3463, longitude: 55.4209, timezone: 4),

      // Kuwait
      City(nameAr: 'الكويت', nameEn: 'Kuwait City', countryAr: 'الكويت', countryEn: 'Kuwait', latitude: 29.3759, longitude: 47.9774, timezone: 3),

      // Qatar
      City(nameAr: 'الدوحة', nameEn: 'Doha', countryAr: 'قطر', countryEn: 'Qatar', latitude: 25.2854, longitude: 51.5310, timezone: 3),

      // Bahrain
      City(nameAr: 'المنامة', nameEn: 'Manama', countryAr: 'البحرين', countryEn: 'Bahrain', latitude: 26.2285, longitude: 50.5860, timezone: 3),

      // Oman
      City(nameAr: 'مسقط', nameEn: 'Muscat', countryAr: 'عُمان', countryEn: 'Oman', latitude: 23.5880, longitude: 58.3829, timezone: 4),

      // Jordan
      City(nameAr: 'عمّان', nameEn: 'Amman', countryAr: 'الأردن', countryEn: 'Jordan', latitude: 31.9454, longitude: 35.9284, timezone: 3),
      City(nameAr: 'إربد', nameEn: 'Irbid', countryAr: 'الأردن', countryEn: 'Jordan', latitude: 32.5556, longitude: 35.8500, timezone: 3),

      // Lebanon
      City(nameAr: 'بيروت', nameEn: 'Beirut', countryAr: 'لبنان', countryEn: 'Lebanon', latitude: 33.8938, longitude: 35.5018, timezone: 2),

      // Syria
      City(nameAr: 'دمشق', nameEn: 'Damascus', countryAr: 'سوريا', countryEn: 'Syria', latitude: 33.5138, longitude: 36.2765, timezone: 3),
      City(nameAr: 'حلب', nameEn: 'Aleppo', countryAr: 'سوريا', countryEn: 'Syria', latitude: 36.2021, longitude: 37.1343, timezone: 3),

      // Iraq
      City(nameAr: 'بغداد', nameEn: 'Baghdad', countryAr: 'العراق', countryEn: 'Iraq', latitude: 33.3152, longitude: 44.3661, timezone: 3),
      City(nameAr: 'البصرة', nameEn: 'Basra', countryAr: 'العراق', countryEn: 'Iraq', latitude: 30.5081, longitude: 47.7835, timezone: 3),
      City(nameAr: 'أربيل', nameEn: 'Erbil', countryAr: 'العراق', countryEn: 'Iraq', latitude: 36.1911, longitude: 44.0091, timezone: 3),

      // Palestine
      City(nameAr: 'القدس', nameEn: 'Jerusalem', countryAr: 'فلسطين', countryEn: 'Palestine', latitude: 31.7683, longitude: 35.2137, timezone: 2),
      City(nameAr: 'غزة', nameEn: 'Gaza', countryAr: 'فلسطين', countryEn: 'Palestine', latitude: 31.5018, longitude: 34.4668, timezone: 2),
      City(nameAr: 'الخليل', nameEn: 'Hebron', countryAr: 'فلسطين', countryEn: 'Palestine', latitude: 31.5326, longitude: 35.0998, timezone: 2),
      City(nameAr: 'رام الله', nameEn: 'Ramallah', countryAr: 'فلسطين', countryEn: 'Palestine', latitude: 31.9038, longitude: 35.2034, timezone: 2),

      // Yemen
      City(nameAr: 'صنعاء', nameEn: 'Sanaa', countryAr: 'اليمن', countryEn: 'Yemen', latitude: 15.3694, longitude: 44.1910, timezone: 3),
      City(nameAr: 'عدن', nameEn: 'Aden', countryAr: 'اليمن', countryEn: 'Yemen', latitude: 12.7855, longitude: 45.0187, timezone: 3),

      // Libya
      City(nameAr: 'طرابلس', nameEn: 'Tripoli', countryAr: 'ليبيا', countryEn: 'Libya', latitude: 32.8872, longitude: 13.1913, timezone: 2),
      City(nameAr: 'بنغازي', nameEn: 'Benghazi', countryAr: 'ليبيا', countryEn: 'Libya', latitude: 32.1194, longitude: 20.0868, timezone: 2),

      // Tunisia
      City(nameAr: 'تونس', nameEn: 'Tunis', countryAr: 'تونس', countryEn: 'Tunisia', latitude: 36.8065, longitude: 10.1815, timezone: 1),

      // Algeria
      City(nameAr: 'الجزائر', nameEn: 'Algiers', countryAr: 'الجزائر', countryEn: 'Algeria', latitude: 36.7538, longitude: 3.0588, timezone: 1),
      City(nameAr: 'وهران', nameEn: 'Oran', countryAr: 'الجزائر', countryEn: 'Algeria', latitude: 35.6971, longitude: -0.6308, timezone: 1),

      // Morocco
      City(nameAr: 'الرباط', nameEn: 'Rabat', countryAr: 'المغرب', countryEn: 'Morocco', latitude: 34.0209, longitude: -6.8416, timezone: 1),
      City(nameAr: 'الدار البيضاء', nameEn: 'Casablanca', countryAr: 'المغرب', countryEn: 'Morocco', latitude: 33.5731, longitude: -7.5898, timezone: 1),
      City(nameAr: 'مراكش', nameEn: 'Marrakech', countryAr: 'المغرب', countryEn: 'Morocco', latitude: 31.6295, longitude: -7.9811, timezone: 1),
      City(nameAr: 'فاس', nameEn: 'Fes', countryAr: 'المغرب', countryEn: 'Morocco', latitude: 34.0181, longitude: -5.0078, timezone: 1),

      // Sudan
      City(nameAr: 'الخرطوم', nameEn: 'Khartoum', countryAr: 'السودان', countryEn: 'Sudan', latitude: 15.5007, longitude: 32.5599, timezone: 2),

      // Somalia
      City(nameAr: 'مقديشو', nameEn: 'Mogadishu', countryAr: 'الصومال', countryEn: 'Somalia', latitude: 2.0469, longitude: 45.3182, timezone: 3),

      // Mauritania
      City(nameAr: 'نواكشوط', nameEn: 'Nouakchott', countryAr: 'موريتانيا', countryEn: 'Mauritania', latitude: 18.0735, longitude: -15.9582, timezone: 0),

      // Turkey
      City(nameAr: 'إسطنبول', nameEn: 'Istanbul', countryAr: 'تركيا', countryEn: 'Turkey', latitude: 41.0082, longitude: 28.9784, timezone: 3),
      City(nameAr: 'أنقرة', nameEn: 'Ankara', countryAr: 'تركيا', countryEn: 'Turkey', latitude: 39.9334, longitude: 32.8597, timezone: 3),
      City(nameAr: 'إزمير', nameEn: 'Izmir', countryAr: 'تركيا', countryEn: 'Turkey', latitude: 38.4237, longitude: 27.1428, timezone: 3),

      // Iran
      City(nameAr: 'طهران', nameEn: 'Tehran', countryAr: 'إيران', countryEn: 'Iran', latitude: 35.6892, longitude: 51.3890, timezone: 3.5),
      City(nameAr: 'مشهد', nameEn: 'Mashhad', countryAr: 'إيران', countryEn: 'Iran', latitude: 36.2605, longitude: 59.6168, timezone: 3.5),
      City(nameAr: 'أصفهان', nameEn: 'Isfahan', countryAr: 'إيران', countryEn: 'Iran', latitude: 32.6546, longitude: 51.6680, timezone: 3.5),

      // Pakistan
      City(nameAr: 'إسلام آباد', nameEn: 'Islamabad', countryAr: 'باكستان', countryEn: 'Pakistan', latitude: 33.6844, longitude: 73.0479, timezone: 5),
      City(nameAr: 'كراتشي', nameEn: 'Karachi', countryAr: 'باكستان', countryEn: 'Pakistan', latitude: 24.8607, longitude: 67.0011, timezone: 5),
      City(nameAr: 'لاهور', nameEn: 'Lahore', countryAr: 'باكستان', countryEn: 'Pakistan', latitude: 31.5204, longitude: 74.3587, timezone: 5),

      // Malaysia
      City(nameAr: 'كوالالمبور', nameEn: 'Kuala Lumpur', countryAr: 'ماليزيا', countryEn: 'Malaysia', latitude: 3.1390, longitude: 101.6869, timezone: 8),

      // Indonesia
      City(nameAr: 'جاكرتا', nameEn: 'Jakarta', countryAr: 'إندونيسيا', countryEn: 'Indonesia', latitude: -6.2088, longitude: 106.8456, timezone: 7),

      // India
      City(nameAr: 'نيودلهي', nameEn: 'New Delhi', countryAr: 'الهند', countryEn: 'India', latitude: 28.6139, longitude: 77.2090, timezone: 5.5),
      City(nameAr: 'مومباي', nameEn: 'Mumbai', countryAr: 'الهند', countryEn: 'India', latitude: 19.0760, longitude: 72.8777, timezone: 5.5),
      City(nameAr: 'حيدر أباد', nameEn: 'Hyderabad', countryAr: 'الهند', countryEn: 'India', latitude: 17.3850, longitude: 78.4867, timezone: 5.5),

      // Bangladesh
      City(nameAr: 'دكا', nameEn: 'Dhaka', countryAr: 'بنغلاديش', countryEn: 'Bangladesh', latitude: 23.8103, longitude: 90.4125, timezone: 6),

      // Afghanistan
      City(nameAr: 'كابل', nameEn: 'Kabul', countryAr: 'أفغانستان', countryEn: 'Afghanistan', latitude: 34.5553, longitude: 69.2075, timezone: 4.5),

      // Nigeria
      City(nameAr: 'أبوجا', nameEn: 'Abuja', countryAr: 'نيجيريا', countryEn: 'Nigeria', latitude: 9.0765, longitude: 7.3986, timezone: 1),
      City(nameAr: 'لاغوس', nameEn: 'Lagos', countryAr: 'نيجيريا', countryEn: 'Nigeria', latitude: 6.5244, longitude: 3.3792, timezone: 1),

      // South Africa
      City(nameAr: 'جوهانسبرغ', nameEn: 'Johannesburg', countryAr: 'جنوب أفريقيا', countryEn: 'South Africa', latitude: -26.2041, longitude: 28.0473, timezone: 2),
      City(nameAr: 'كيب تاون', nameEn: 'Cape Town', countryAr: 'جنوب أفريقيا', countryEn: 'South Africa', latitude: -33.9249, longitude: 18.4241, timezone: 2),

      // UK
      City(nameAr: 'لندن', nameEn: 'London', countryAr: 'بريطانيا', countryEn: 'UK', latitude: 51.5074, longitude: -0.1278, timezone: 0),

      // France
      City(nameAr: 'باريس', nameEn: 'Paris', countryAr: 'فرنسا', countryEn: 'France', latitude: 48.8566, longitude: 2.3522, timezone: 1),

      // Germany
      City(nameAr: 'برلين', nameEn: 'Berlin', countryAr: 'ألمانيا', countryEn: 'Germany', latitude: 52.5200, longitude: 13.4050, timezone: 1),

      // USA
      City(nameAr: 'نيويورك', nameEn: 'New York', countryAr: 'أمريكا', countryEn: 'USA', latitude: 40.7128, longitude: -74.0060, timezone: -5),
      City(nameAr: 'لوس أنجلوس', nameEn: 'Los Angeles', countryAr: 'أمريكا', countryEn: 'USA', latitude: 34.0522, longitude: -118.2437, timezone: -8),
      City(nameAr: 'شيكاغو', nameEn: 'Chicago', countryAr: 'أمريكا', countryEn: 'USA', latitude: 41.8781, longitude: -87.6298, timezone: -6),
      City(nameAr: 'هيوستن', nameEn: 'Houston', countryAr: 'أمريكا', countryEn: 'USA', latitude: 29.7604, longitude: -95.3698, timezone: -6),
      City(nameAr: 'ديربورن', nameEn: 'Dearborn', countryAr: 'أمريكا', countryEn: 'USA', latitude: 42.3223, longitude: -83.1763, timezone: -5),

      // Canada
      City(nameAr: 'تورنتو', nameEn: 'Toronto', countryAr: 'كندا', countryEn: 'Canada', latitude: 43.6532, longitude: -79.3832, timezone: -5),
      City(nameAr: 'مونتريال', nameEn: 'Montreal', countryAr: 'كندا', countryEn: 'Canada', latitude: 45.5017, longitude: -73.5673, timezone: -5),

      // Australia
      City(nameAr: 'سيدني', nameEn: 'Sydney', countryAr: 'أستراليا', countryEn: 'Australia', latitude: -33.8688, longitude: 151.2093, timezone: 10),
      City(nameAr: 'ملبورن', nameEn: 'Melbourne', countryAr: 'أستراليا', countryEn: 'Australia', latitude: -37.8136, longitude: 144.9631, timezone: 10),

      // Russia
      City(nameAr: 'موسكو', nameEn: 'Moscow', countryAr: 'روسيا', countryEn: 'Russia', latitude: 55.7558, longitude: 37.6173, timezone: 3),
      City(nameAr: 'قازان', nameEn: 'Kazan', countryAr: 'روسيا', countryEn: 'Russia', latitude: 55.7887, longitude: 49.1221, timezone: 3),

      // China
      City(nameAr: 'بكين', nameEn: 'Beijing', countryAr: 'الصين', countryEn: 'China', latitude: 39.9042, longitude: 116.4074, timezone: 8),
      City(nameAr: 'أورومتشي', nameEn: 'Urumqi', countryAr: 'الصين', countryEn: 'China', latitude: 43.8256, longitude: 87.6168, timezone: 6),

      // Japan
      City(nameAr: 'طوكيو', nameEn: 'Tokyo', countryAr: 'اليابان', countryEn: 'Japan', latitude: 35.6762, longitude: 139.6503, timezone: 9),

      // Philippines
      City(nameAr: 'مانيلا', nameEn: 'Manila', countryAr: 'الفلبين', countryEn: 'Philippines', latitude: 14.5995, longitude: 120.9842, timezone: 8),

      // Thailand
      City(nameAr: 'بانكوك', nameEn: 'Bangkok', countryAr: 'تايلاند', countryEn: 'Thailand', latitude: 13.7563, longitude: 100.5018, timezone: 7),

      // Brazil
      City(nameAr: 'ساو باولو', nameEn: 'São Paulo', countryAr: 'البرازيل', countryEn: 'Brazil', latitude: -23.5505, longitude: -46.6333, timezone: -3),

      // Argentina
      City(nameAr: 'بوينس آيرس', nameEn: 'Buenos Aires', countryAr: 'الأرجنتين', countryEn: 'Argentina', latitude: -34.6037, longitude: -58.3816, timezone: -3),

      // Tanzania
      City(nameAr: 'دار السلام', nameEn: 'Dar es Salaam', countryAr: 'تنزانيا', countryEn: 'Tanzania', latitude: -6.7924, longitude: 39.2083, timezone: 3),

      // Senegal
      City(nameAr: 'داكار', nameEn: 'Dakar', countryAr: 'السنغال', countryEn: 'Senegal', latitude: 14.7167, longitude: -17.4677, timezone: 0),

      // Djibouti
      City(nameAr: 'جيبوتي', nameEn: 'Djibouti', countryAr: 'جيبوتي', countryEn: 'Djibouti', latitude: 11.5721, longitude: 43.1456, timezone: 3),

      // Comoros
      City(nameAr: 'موروني', nameEn: 'Moroni', countryAr: 'جزر القمر', countryEn: 'Comoros', latitude: -11.7167, longitude: 43.2500, timezone: 3),

      // Maldives
      City(nameAr: 'ماليه', nameEn: 'Malé', countryAr: 'جزر المالديف', countryEn: 'Maldives', latitude: 4.1755, longitude: 73.5093, timezone: 5),

      // Singapore
      City(nameAr: 'سنغافورة', nameEn: 'Singapore', countryAr: 'سنغافورة', countryEn: 'Singapore', latitude: 1.3521, longitude: 103.8198, timezone: 8),

      // Albania
      City(nameAr: 'تيرانا', nameEn: 'Tirana', countryAr: 'ألبانيا', countryEn: 'Albania', latitude: 41.3275, longitude: 19.8187, timezone: 1),

      // Bosnia
      City(nameAr: 'سراييفو', nameEn: 'Sarajevo', countryAr: 'البوسنة', countryEn: 'Bosnia', latitude: 43.8563, longitude: 18.4131, timezone: 1),

      // Kosovo
      City(nameAr: 'بريشتينا', nameEn: 'Pristina', countryAr: 'كوسوفو', countryEn: 'Kosovo', latitude: 42.6629, longitude: 21.1655, timezone: 1),
    ];
  }

  static List<String> getCountries(String lang) {
    final cities = getAllCities();
    final countries = <String>{};
    for (var city in cities) {
      countries.add(lang == 'ar' ? city.countryAr : city.countryEn);
    }
    return countries.toList()..sort();
  }

  static List<City> getCitiesByCountry(String country, String lang) {
    return getAllCities().where((city) {
      return (lang == 'ar' ? city.countryAr : city.countryEn) == country;
    }).toList();
  }
}
