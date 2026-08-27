import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';
import 'package:valorant_guide_app/theme/settings_provider.dart';
import 'package:valorant_guide_app/theme/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  final double bottomOverlayHeight;
  const SettingsScreen({super.key, this.bottomOverlayHeight = 0});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _privacyAnimController;
  late Animation<double> _privacyScaleAnimation;

  @override
  void initState() {
    super.initState();
    _privacyAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _privacyScaleAnimation = CurvedAnimation(
      parent: _privacyAnimController,
      curve: Curves.easeInOut,
    );
    _privacyAnimController.forward();
  }

  @override
  void dispose() {
    _privacyAnimController.dispose();
    super.dispose();
  }

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
        padding: EdgeInsets.fromLTRB(20, 15, 20, widget.bottomOverlayHeight + 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APPEARANCE SECTION
            _buildSectionHeader("APPEARANCE", brightness),
            const SizedBox(height: 12),
            _buildAppearanceToggle(context, brightness),

            const SizedBox(height: 25),

            // VIDEO AUTOPLAY
            _buildSectionHeader("VIDEO AUTOPLAY", brightness),
            const SizedBox(height: 12),
            _buildAutoplayToggle(context, brightness),

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
            ScaleTransition(
              scale: _privacyScaleAnimation,
              child: GestureDetector(
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
            ),

            const SizedBox(height: 25),

            // SOCIALS
            _buildSectionHeader("SOCIALS", brightness),
            const SizedBox(height: 12),
            _buildInfoCard(
              brightness: brightness,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSocialIcon(
                    context: context,
                    brightness: brightness,
                    iconPath: 'assets/icon/facebook.png',
                    label: "Facebook",
                    url: "https://www.facebook.com/bibekgiri4208",
                  ),
                  _buildSocialIcon(
                    context: context,
                    brightness: brightness,
                    iconPath: 'assets/icon/github.png',
                    label: "GitHub",
                    url: "https://github.com/bibekgiri4208",
                  ),
                  _buildSocialIcon(
                    context: context,
                    brightness: brightness,
                    iconPath: 'assets/icon/instagram.png',
                    label: "Instagram",
                    url: "https://www.instagram.com/bibekgiri4208/",
                  ),
                ],
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

    return GestureDetector(
      onTap: () => themeProvider.setThemeMode(
        isDark ? ThemeMode.light : ThemeMode.dark,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.card(brightness),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.divider(brightness), width: 1.5),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final optionWidth = (constraints.maxWidth - 8) / 2;
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: isDark ? 0 : optionWidth + 8,
                  top: 0,
                  bottom: 0,
                  width: optionWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildToggleOption(
                        brightness: brightness,
                        icon: Icons.dark_mode_rounded,
                        label: "Dark",
                        isSelected: isDark,
                      ),
                    ),
                    Expanded(
                      child: _buildToggleOption(
                        brightness: brightness,
                        icon: Icons.light_mode_rounded,
                        label: "Light",
                        isSelected: !isDark,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAutoplayToggle(BuildContext context, Brightness brightness) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final isEnabled = settingsProvider.autoplayEnabled;

    return GestureDetector(
      onTap: () => settingsProvider.setAutoplay(!isEnabled),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.card(brightness),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.divider(brightness), width: 1.5),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final optionWidth = (constraints.maxWidth - 8) / 2;
            return Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: isEnabled ? 0 : optionWidth + 8,
                  top: 0,
                  bottom: 0,
                  width: optionWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildToggleOption(
                        brightness: brightness,
                        icon: Icons.play_circle_outline_rounded,
                        label: "Enable",
                        isSelected: isEnabled,
                      ),
                    ),
                    Expanded(
                      child: _buildToggleOption(
                        brightness: brightness,
                        icon: Icons.pause_circle_outline_rounded,
                        label: "Disable",
                        isSelected: !isEnabled,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildToggleOption({
    required Brightness brightness,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: isSelected ? Colors.white : AppColors.textSecondary(brightness),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Valorant',
              fontSize: 12,
              color: isSelected ? Colors.white : AppColors.textSecondary(brightness),
              letterSpacing: 1.0,
            ),
          ),
        ],
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
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Privacy Policy',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
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
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildSocialIcon({
    required BuildContext context,
    required Brightness brightness,
    required String iconPath,
    required String label,
    required String url,
  }) {
    return GestureDetector(
      onTap: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(iconPath, fit: BoxFit.contain),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Gabarito',
              fontSize: 11,
              color: AppColors.textSecondary(brightness),
            ),
          ),
        ],
      ),
    );
  }
}
