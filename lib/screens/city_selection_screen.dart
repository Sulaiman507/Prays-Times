import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/cities_data.dart';

class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  State<CitySelectionScreen> createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen>
    with TickerProviderStateMixin {
  String _searchQuery = '';
  String? _selectedCountry;
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final isAr = settingsProvider.isArabic;
    final lang = isAr ? 'ar' : 'en';

    final countries = CitiesData.getCountries(lang);
    final cities = _selectedCountry != null
        ? CitiesData.getCitiesByCountry(_selectedCountry!, lang)
        : _getFilteredCities(lang);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAr ? 'اختر المدينة' : 'Select City',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(isAr ? Icons.arrow_forward : Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeController,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF161B22) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: isAr ? 'بحث...' : 'Search...',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white38 : Colors.grey,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF1B4332)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                    _selectedCountry = null;
                  });
                },
              ),
            ),
            if (_searchQuery.isEmpty)
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    final country = countries[index];
                    final isSelected = _selectedCountry == country;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCountry = isSelected ? null : country;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF1B4332)
                                : (isDark ? const Color(0xFF161B22) : Colors.white),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF1B4332)
                                  : (isDark ? Colors.white24 : Colors.grey.shade300),
                            ),
                          ),
                          child: Text(
                            country,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : (isDark ? Colors.white70 : Colors.grey.shade700),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 8),
            Expanded(
              child: cities.isEmpty
                  ? Center(
                      child: Text(
                        isAr ? 'لا توجد نتائج' : 'No results found',
                        style: TextStyle(
                          color: isDark ? Colors.white54 : Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cities.length,
                      itemBuilder: (context, index) {
                        final city = cities[index];
                        final cityName = isAr ? city.nameAr : city.nameEn;
                        final countryName = isAr ? city.countryAr : city.countryEn;
                        final isCurrentCity =
                            settingsProvider.selectedCity.latitude == city.latitude &&
                                settingsProvider.selectedCity.longitude == city.longitude;

                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 300 + index * 50),
                          curve: Curves.easeOutCubic,
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(30 * (1 - value), 0),
                              child: Opacity(
                                opacity: value,
                                child: child,
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isCurrentCity
                                    ? const Color(0xFFD4AF37).withOpacity(0.2)
                                    : const Color(0xFF1B4332).withOpacity(isDark ? 0.15 : 0.1),
                              ),
                              child: Icon(
                                isCurrentCity ? Icons.check_circle : Icons.location_on_outlined,
                                color: isCurrentCity ? const Color(0xFFD4AF37) : const Color(0xFF1B4332),
                                size: 22,
                              ),
                            ),
                            title: Text(
                              cityName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                              ),
                            ),
                            subtitle: Text(
                              countryName,
                              style: TextStyle(
                                fontSize: 12,
                                color: isDark ? Colors.white54 : Colors.grey,
                              ),
                            ),
                            onTap: () {
                              settingsProvider.setCity(city);
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  List<City> _getFilteredCities(String lang) {
    final allCities = CitiesData.getAllCities();
    if (_searchQuery.isEmpty) return allCities;
    return allCities.where((city) {
      final name = lang == 'ar' ? city.nameAr : city.nameEn;
      final country = lang == 'ar' ? city.countryAr : city.countryEn;
      return name.contains(_searchQuery) || country.contains(_searchQuery);
    }).toList();
  }
}
