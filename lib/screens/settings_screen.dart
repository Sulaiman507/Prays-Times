import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/settings_provider.dart';
import '../models/prayer_time_model.dart';
import 'city_selection_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final isDark = themeProvider.isDarkMode;
    final isAr = settingsProvider.isArabic;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAr ? 'الإعدادات' : 'Settings',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(isAr ? Icons.arrow_forward : Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader(context, isAr ? 'اللغة' : 'Language', isDark),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            isDark: isDark,
            icon: Icons.language,
            title: isAr ? 'اللغة' : 'Language',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLangButton(context, 'ar', isAr, isDark),
                const SizedBox(width: 8),
                _buildLangButton(context, 'en', !isAr, isDark),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader(context, isAr ? 'صيغة الوقت' : 'Time Format', isDark),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            isDark: isDark,
            icon: Icons.access_time,
            title: isAr ? 'صيغة الوقت' : 'Time Format',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildFormatButton(
                  context,
                  TimeFormat.hour12,
                  isAr ? '12 ساعة' : '12H',
                  settingsProvider.timeFormat == TimeFormat.hour12,
                  isDark,
                ),
                const SizedBox(width: 8),
                _buildFormatButton(
                  context,
                  TimeFormat.hour24,
                  isAr ? '24 ساعة' : '24H',
                  settingsProvider.timeFormat == TimeFormat.hour24,
                  isDark,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader(context, isAr ? 'المظهر' : 'Appearance', isDark),
          const SizedBox(height: 8),
          _buildThemeOptions(context, themeProvider, isAr, isDark),
          const SizedBox(height: 24),
          _buildSectionHeader(context, isAr ? 'المدينة' : 'City', isDark),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            isDark: isDark,
            icon: Icons.location_city,
            title: isAr ? 'المدينة' : 'City',
            subtitle: settingsProvider.cityName,
            trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Color(0xFF1B4332)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CitySelectionScreen()),
              );
            },
          ),
          const SizedBox(height: 24),
          _buildSectionHeader(context, isAr ? 'طريقة الحساب' : 'Calculation Method', isDark),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            isDark: isDark,
            icon: Icons.calculate,
            title: isAr ? 'طريقة الحساب' : 'Calculation Method',
            subtitle: isAr ? 'أم القرى' : 'Umm al-Qura',
            trailing: const Icon(Icons.check_circle, color: Color(0xFFD4AF37), size: 20),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader(context, isAr ? 'حول التطبيق' : 'About', isDark),
          const SizedBox(height: 8),
          _buildSettingCard(
            context,
            isDark: isDark,
            icon: Icons.info_outline,
            title: isAr ? 'الإصدار' : 'Version',
            subtitle: '1.0.0',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white54 : const Color(0xFF1B4332).withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _buildSettingCard(
    BuildContext context, {
    required bool isDark,
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF161B22) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1B4332).withOpacity(isDark ? 0.2 : 0.1),
              ),
              child: Icon(icon, color: const Color(0xFF1B4332), size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF1A1A2E),
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.white54 : Colors.grey,
                      ),
                    ),
                ],
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildLangButton(
      BuildContext context, String lang, bool isSelected, bool isDark) {
    return GestureDetector(
      onTap: () {
        Provider.of<SettingsProvider>(context, listen: false).setLanguage(lang);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1B4332)
              : (isDark ? const Color(0xFF21262D) : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          lang == 'ar' ? 'عربي' : 'EN',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildFormatButton(
    BuildContext context,
    TimeFormat format,
    String label,
    bool isSelected,
    bool isDark,
  ) {
    return GestureDetector(
      onTap: () {
        Provider.of<SettingsProvider>(context, listen: false)
            .setTimeFormat(format);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1B4332)
              : (isDark ? const Color(0xFF21262D) : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildThemeOptions(
      BuildContext context, ThemeProvider themeProvider, bool isAr, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF161B22) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildThemeOption(context, themeProvider, ThemeMode.light, Icons.wb_sunny, isAr ? 'فاتح' : 'Light', isDark),
          const Divider(height: 1),
          _buildThemeOption(context, themeProvider, ThemeMode.dark, Icons.nightlight_round, isAr ? 'داكن' : 'Dark', isDark),
          const Divider(height: 1),
          _buildThemeOption(context, themeProvider, ThemeMode.system, Icons.settings_brightness, isAr ? 'النظام' : 'System', isDark),
        ],
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    ThemeProvider themeProvider,
    ThemeMode mode,
    IconData icon,
    String label,
    bool isDark,
  ) {
    final isSelected = themeProvider.themeMode == mode;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: isSelected ? const Color(0xFF1B4332) : (isDark ? Colors.white54 : Colors.grey)),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          color: isSelected ? const Color(0xFF1B4332) : (isDark ? Colors.white : const Color(0xFF1A1A2E)),
        ),
      ),
      trailing: isSelected ? const Icon(Icons.check_circle, color: Color(0xFFD4AF37), size: 22) : null,
      onTap: () => themeProvider.setTheme(mode),
    );
  }
}
