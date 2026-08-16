import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C252E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C252E),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Developer Profile",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PROFILE CARD HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF12181F),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFF4654), width: 2),
              ),
              child: Row(
                children: [
                  // Avatar Box
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4654),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.person_rounded,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Name & Tagline
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Bibek Giri",
                          style: TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Developer of vAlo guide",
                          style: TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 11,
                            color: const Color(0xFFFF4654),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Agent No. #0",
                          style: TextStyle(color: Colors.white54, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // MISSION OBJECTIVE
            const Text(
              "MISSION OBJECTIVE",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF12181F),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white),
              ),
              child: const Text(
                "Created to provide Valorant players with a fast, mobile-friendly companion app. Built to offer instant visual intel on agent rosters, ability mechanics, video demonstrations and agents's biography without needing desktop browser searches during active sessions.",
                style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
              ),
            ),

            const SizedBox(height: 25),

            // KEY BENEFITS SECTION
            const Text(
              "TACTICAL ADVANTAGES",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            _buildBenefitTile(
              icon: Icons.play_circle_outline_rounded,
              title: "Visual Ability Intel",
              description:
                  "Embedded video previews allow players to inspect ability execution, trajectory, and timing in real-time.",
            ),
            const SizedBox(height: 10),
            _buildBenefitTile(
              icon: Icons.grid_view_rounded,
              title: "Role-Based Navigation",
              description:
                  "Effortlessly filter agents across Duelist, Controller, Initiator, and Sentinel roles.",
            ),
            const SizedBox(height: 10),
            _buildBenefitTile(
              icon: Icons.bolt_rounded,
              title: "Mobile Optimized UI",
              description:
                  "Tactile animations, dark mode aesthetics, and low-latency navigation tailored for quick mobile reference.",
            ),

            const SizedBox(height: 25),

            // BIO SECTION
            const Text(
              "BIOGRAPHY",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF12181F),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white),
              ),
              child: const Text(
                "I'm a Passionate mobile app developer specializing in crafting sleek, responsive, and tactile cross-platform mobile experiences. Dedicated to high-performance graphics, clean architecture, and immersive gaming UI design. If you liked my application, feel free to check out my other projects on GitHub.",
                style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
              ),
            ),

            const SizedBox(height: 25),

            // CONTACT LINKS
            const Text(
              "TRANSMISSIONS",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 14,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            _buildContactTile(
              icon: Icons.code_rounded,
              label: "GitHub",
              value: "github.com/bibekgiri4208",
              onTap: () => _launchURL("https://github.com/bibekgiri4208"),
            ),
            const SizedBox(height: 10),
            _buildContactTile(
              icon: Icons.email_outlined,
              label: "Email",
              value: "giribibek01@gmail.com",
              onTap: () => _launchURL("mailto:giribibek01@gmail.com"),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget buildState(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF12181F),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 9,
                fontFamily: "Valorant",
                color: Colors.grey,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontFamily: "Valorant",
                color: Colors.white,
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
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF12181F),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4654).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFFFF4654), size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
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
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF12181F),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFFF4654), size: 22),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
