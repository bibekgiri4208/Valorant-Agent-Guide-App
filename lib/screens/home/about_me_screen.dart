import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';
import 'package:valorant_guide_app/theme/theme_provider.dart';

class AboutMeScreen extends StatelessWidget {
  final double bottomOverlayHeight;
  const AboutMeScreen({super.key, this.bottomOverlayHeight = 0});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
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
          "About vAlo Guide",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 1.5,
            shadows: const [
              Shadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 15, 20, bottomOverlayHeight + 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE CARD HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.card(brightness),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.accent, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Developer",
                        style: TextStyle(
                          fontFamily: 'Valorant',
                          fontSize: 10,
                          color: AppColors.accent,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.scaffold(brightness),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppColors.divider(brightness),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "AGENT #0",
                          style: TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 9,
                            color: AppColors.textSecondary(brightness),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          color: AppColors.scaffold(brightness),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.divider(brightness),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.asset(
                            'assets/logo/jester_logo.webp',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bibek Giri",
                              style: TextStyle(
                                fontFamily: 'Valorant',
                                fontSize: 22,
                                color: AppColors.textPrimary(brightness),
                                letterSpacing: 1.0,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "vALO GUIDE ARCHITECT",
                              style: TextStyle(
                                fontFamily: 'Valorant',
                                fontSize: 10,
                                color: AppColors.textSecondary(brightness),
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "AKA: THE JESTER",
                              style: TextStyle(
                                fontFamily: 'Valorant',
                                fontSize: 10,
                                color: AppColors.textSecondary(brightness),
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // APPEARANCE TOGGLE
            Text(
              "APPEARANCE",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: AppColors.textPrimary(brightness),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            _buildAppearanceToggle(context, brightness),

            const SizedBox(height: 25),

            // MISSION OBJECTIVE
            Text(
              "MISSION OBJECTIVE",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: AppColors.textPrimary(brightness),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card(brightness),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.divider(brightness),
                  width: 1.5,
                ),
              ),
              child: Text(
                "Created to provide Valorant players with a fast, mobile-friendly companion app. Built to offer instant visual intel on agent rosters, ability mechanics, video demonstrations, and agent biographies without needing desktop browser searches during active sessions.",
                style: TextStyle(
                  color: AppColors.textSecondary(brightness),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // KEY BENEFITS SECTION
            Text(
              "TACTICAL ADVANTAGES",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: AppColors.textPrimary(brightness),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            _buildBenefitTile(
              icon: Icons.play_circle_outline_rounded,
              title: "Visual Ability Intel",
              description:
                  "Embedded video previews allow players to inspect ability execution, trajectory, and timing in real-time.",
              brightness: brightness,
            ),
            const SizedBox(height: 10),
            _buildBenefitTile(
              icon: Icons.grid_view_rounded,
              title: "Role-Based Navigation",
              description:
                  "Effortlessly filter agents across Duelist, Controller, Initiator, and Sentinel roles.",
              brightness: brightness,
            ),
            const SizedBox(height: 10),
            _buildBenefitTile(
              icon: Icons.bolt_rounded,
              title: "Mobile Optimized UI",
              description:
                  "Tactile animations, dark mode aesthetics, and low-latency navigation tailored for quick mobile reference.",
              brightness: brightness,
            ),
            const SizedBox(height: 10),
            _buildBenefitTile(
              icon: Icons.badge_rounded,
              title: "Complete Agent Dossiers",
              description:
                  "Access full skill breakdowns, character biographies, and role-specific stats for every operative in the Valorant roster.",
              brightness: brightness,
            ),
            const SizedBox(height: 10),
            _buildBenefitTile(
              icon: Icons.speed_rounded,
              title: "Instant Session Reference",
              description:
                  "Engineered for rapid second-screen lookups during live matches without needing to tab out or drop in-game performance.",
              brightness: brightness,
            ),
            const SizedBox(height: 10),
            _buildBenefitTile(
              icon: Icons.menu_book_rounded,
              title: "Tactical Guide Modules",
              description:
                  "A complete library of actionable field tips covering crosshair placement, peeking mechanics, spike timers, and advanced movement.",
              brightness: brightness,
            ),
            const SizedBox(height: 10),
            _buildBenefitTile(
              icon: Icons.monetization_on_rounded,
              title: "Economy & Buy Strategies",
              description:
                  "Master round-by-round credit management, including Full Buys, Eco/Save rounds, Light Buys, and armor math for optimal team spending.",
              brightness: brightness,
            ),

            const SizedBox(height: 25),

            // BIO SECTION
            Text(
              "BIOGRAPHY",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: AppColors.textPrimary(brightness),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card(brightness),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.divider(brightness),
                  width: 1.5,
                ),
              ),
              child: Text(
                "I'm a passionate mobile app developer specializing in crafting sleek, responsive, and tactile cross-platform mobile experiences. Dedicated to high-performance graphics, clean architecture, and immersive gaming UI design. If you liked my application, feel free to check out my other projects on GitHub.",
                style: TextStyle(
                  color: AppColors.textSecondary(brightness),
                  fontSize: 14,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // CONTACT LINKS
            Text(
              "TRANSMISSIONS",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: AppColors.textPrimary(brightness),
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            _buildContactTile(
              icon: Icons.code_rounded,
              label: "GitHub",
              value: "github.com/bibekgiri4208",
              onTap: () => _launchURL("https://github.com/bibekgiri4208"),
              brightness: brightness,
            ),
            const SizedBox(height: 10),
            _buildContactTile(
              icon: Icons.email_outlined,
              label: "Email",
              value: "giribibek01@gmail.com",
              onTap: () => _launchURL("mailto:giribibek01@gmail.com"),
              brightness: brightness,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
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
        border: Border.all(
          color: AppColors.divider(brightness),
          width: 1.5,
        ),
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

  static Widget _buildBenefitTile({
    required IconData icon,
    required String title,
    required String description,
    required Brightness brightness,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card(brightness),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.divider(brightness),
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 14),
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
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary(brightness),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildContactTile({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
    required Brightness brightness,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.card(brightness),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.divider(brightness),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.accent, size: 22),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 11,
                    color: AppColors.textPrimary(brightness),
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary(brightness),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.textPrimary(brightness),
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
