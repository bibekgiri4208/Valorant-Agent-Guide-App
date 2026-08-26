import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';
import 'package:valorant_guide_app/theme/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  final double bottomOverlayHeight;
  const SettingsScreen({super.key, this.bottomOverlayHeight = 0});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, bottomOverlayHeight + 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APPEARANCE SECTION
            _buildSectionHeader("APPEARANCE", brightness),
            const SizedBox(height: 12),
            _buildAppearanceToggle(context, brightness),

            const SizedBox(height: 25),

            // APP DESCRIPTION
            _buildSectionHeader("APP DESCRIPTION", brightness),
            const SizedBox(height: 12),
            _buildInfoCard(
              brightness: brightness,
              child: Text(
                "Valo Guide is a mobile companion app designed for Valorant players. It provides instant access to agent abilities, tactical guides, weapon stats, and role-based navigation — all optimized for quick reference during active sessions.",
                style: TextStyle(
                  fontFamily: 'Gabarito',
                  color: AppColors.textSecondary(brightness),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // APP VERSION
            _buildSectionHeader("APP VERSION", brightness),
            const SizedBox(height: 12),
            _buildInfoCard(
              brightness: brightness,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        'assets/icon/valoguide_icon.webp',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "vAlo Guide",
                        style: TextStyle(
                          fontFamily: 'Valorant',
                          fontSize: 14,
                          color: AppColors.textPrimary(brightness),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Version 1.0.2",
                        style: TextStyle(
                          fontFamily: 'Gabarito',
                          fontSize: 12,
                          color: AppColors.textSecondary(brightness),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // DEVELOPER INFO
            _buildSectionHeader("DEVELOPER", brightness),
            const SizedBox(height: 12),
            _buildInfoCard(
              brightness: brightness,
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.scaffold(brightness),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.divider(brightness)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        'assets/logo/jester_logo.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bibek Giri",
                          style: TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 16,
                            color: AppColors.textPrimary(brightness),
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Creator & Developer",
                          style: TextStyle(
                            fontFamily: 'Gabarito',
                            fontSize: 12,
                            color: AppColors.textSecondary(brightness),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // CREDITS
            _buildSectionHeader("CREDITS", brightness),
            const SizedBox(height: 12),
            _buildInfoCard(
              brightness: brightness,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCreditRow(
                    "Valorant",
                    "Game assets & inspiration",
                    brightness,
                  ),
                  const SizedBox(height: 10),
                  _buildCreditRow(
                    "Riot Games",
                    "Character & ability designs",
                    brightness,
                  ),
                  const SizedBox(height: 10),
                  _buildCreditRow(
                    "Brylark",
                    "For Valorant Style Fonts",
                    brightness,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // DISCLAIMER
            _buildSectionHeader("DISCLAIMER", brightness),
            const SizedBox(height: 12),
            _buildInfoCard(
              brightness: brightness,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.gold,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "This is an unofficial, fan-made valorant guide app. It is not affiliated with, endorsed by, or connected to Riot Games in any way. All game assets; character names, images, videos and related content are property of Riot Games.",
                      style: TextStyle(
                        fontFamily: 'Gabarito',
                        color: AppColors.textSecondary(brightness),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // OPEN SOURCE LICENSES
            _buildSectionHeader("OPEN SOURCE LICENSES", brightness),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'vAlo Guide',
                applicationVersion: '1.0.2',
              ),
              child: _buildInfoCard(
                brightness: brightness,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.description_rounded,
                        color: AppColors.accent,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Open Source Licenses",
                            style: TextStyle(
                              fontFamily: 'Valorant',
                              fontSize: 14,
                              color: AppColors.textPrimary(brightness),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "View licenses for all Flutter dependencies",
                            style: TextStyle(
                              fontFamily: 'Gabarito',
                              fontSize: 12,
                              color: AppColors.textSecondary(brightness),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textSecondary(brightness),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            // PRIVACY POLICY
            _buildSectionHeader("PRIVACY POLICY", brightness),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _showPrivacyPolicy(context, brightness),
              child: _buildInfoCard(
                brightness: brightness,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.privacy_tip_rounded,
                        color: AppColors.accent,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                              fontFamily: 'Valorant',
                              fontSize: 14,
                              color: AppColors.textPrimary(brightness),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "How we handle your data",
                            style: TextStyle(
                              fontFamily: 'Gabarito',
                              fontSize: 12,
                              color: AppColors.textSecondary(brightness),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textSecondary(brightness),
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Brightness brightness) {
    return Row(
      children: [
        Container(width: 4, height: 16, color: AppColors.accent),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Valorant',
            fontSize: 12,
            color: AppColors.accent,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required Brightness brightness,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card(brightness),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider(brightness), width: 1.5),
      ),
      child: child,
    );
  }

  Widget _buildAppearanceToggle(BuildContext context, Brightness brightness) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.card(brightness),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.divider(brightness), width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildThemeOption(
              context: context,
              brightness: brightness,
              icon: Icons.dark_mode_rounded,
              label: "Dark",
              isSelected: isDark,
              onTap: () => themeProvider.setThemeMode(ThemeMode.dark),
            ),
          ),
          Expanded(
            child: _buildThemeOption(
              context: context,
              brightness: brightness,
              icon: Icons.light_mode_rounded,
              label: "Light",
              isSelected: !isDark,
              onTap: () => themeProvider.setThemeMode(ThemeMode.light),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required Brightness brightness,
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected
                  ? Colors.white
                  : AppColors.textSecondary(brightness),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 12,
                color: isSelected
                    ? Colors.white
                    : AppColors.textSecondary(brightness),
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditRow(String title, String subtitle, Brightness brightness) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          color: AppColors.accent,
          size: 16,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 12,
                  color: AppColors.textPrimary(brightness),
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Gabarito',
                  fontSize: 11,
                  color: AppColors.textSecondary(brightness),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showPrivacyPolicy(BuildContext context, Brightness brightness) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.card(brightness),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.divider(brightness), width: 1.5),
        ),
        title: Text(
          'Privacy Policy',
          style: TextStyle(
            fontFamily: 'Valorant',
            fontSize: 18,
            color: AppColors.textPrimary(brightness),
            letterSpacing: 0.5,
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            "Valo Guide respects your privacy. This app does not collect, store, or share any personal data.\n\n"
            "• No user data is collected or transmitted\n"
            "• No analytics or tracking tools are used\n"
            "• No internet permission is required\n"
            "• All content is stored locally on your device\n\n"
            "This app was built purely for educational and fan purposes. If you have any questions about this privacy policy, please contact the developer.",
            style: TextStyle(
              fontFamily: 'Gabarito',
              fontSize: 14,
              color: AppColors.textSecondary(brightness),
              height: 1.5,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'CLOSE',
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 12,
                color: AppColors.accent,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
