import 'package:flutter/material.dart';

class GameGuideScreen extends StatelessWidget {
  const GameGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C252E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C252E),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Game Guide",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER SECTION
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 18,
                    color: const Color(0xFFFF4654),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "// FIELD PROTOCOL",
                    style: TextStyle(
                      fontFamily: 'Valorant',
                      fontSize: 12,
                      color: Color(0xFFFF4654),
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "GAMEPLAY\nBASICS",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 32,
                  color: Colors.white,
                  height: 1.1,
                  letterSpacing: 1.0,
                ),
              ),

              const SizedBox(height: 24),

              // 1. GAME OBJECTIVE CARD
              _buildGuideSectionCard(
                sectionNumber: "01",
                title: "CORE OBJECTIVE",
                content:
                    "VALORANT is a 5v5 tactical character-based shooter. "
                    "Attackers plant the Spike, while Defenders prevent the plant or defuse it. "
                    "First team to reach 13 round wins takes the victory.",
                icon: Icons.flag_rounded,
              ),

              const SizedBox(height: 16),

              // 2. ECONOMY CARD
              _buildGuideSectionCard(
                sectionNumber: "02",
                title: "ECONOMY SYSTEM",
                content:
                    "At the start of every round, use Credits earned from kills, plants, and round wins "
                    "to purchase weapons, shields, and Agent utility during the Buy Phase.",
                icon: Icons.account_balance_wallet_rounded,
              ),

              const SizedBox(height: 16),

              // 3. GUNPLAY MECHANICS
              _buildGuideSectionCard(
                sectionNumber: "03",
                title: "GUNPLAY & AIMING",
                content:
                    "Movement heavily reduces bullet accuracy. Always come to a complete stop "
                    "before firing. Keep crosshairs at head level for faster reaction times.",
                icon: Icons.ads_click_rounded,
              ),

              const SizedBox(height: 16),

              // 4. AGENT ROLES OVERVIEW
              _buildGuideSectionCard(
                sectionNumber: "04",
                title: "ROLES & UTILITY",
                content:
                    "• Duelists: Take first fights and open site entries.\n"
                    "• Controllers: Block vision with smokes and control territory.\n"
                    "• Initiators: Flush out enemies and scout positions.\n"
                    "• Sentinels: Lock down sites and secure flanks.",
                icon: Icons.groups_rounded,
              ),

              const SizedBox(height: 16),

              // 5. CROSSHAIR PLACEMENT & PEEKING
              _buildGuideSectionCard(
                sectionNumber: "05",
                title: "CROSSHAIR & PEEKING",
                content:
                    "• Pre-aim common enemy head-height angles before rounding corners.\n"
                    "• Use 'A' and 'D' keys to counter-strafe and stop momentum instantly.\n"
                    "• Avoid diagonal peeking (W+A/D) into open sightlines.",
                icon: Icons.center_focus_strong_rounded,
              ),

              const SizedBox(height: 16),

              // 6. MAP CONTROL & COMMUNICATING
              _buildGuideSectionCard(
                sectionNumber: "06",
                title: "MAP & INTEL",
                content:
                    "• Call out enemy locations using precise minimap location names.\n"
                    "• Use noise control (hold Shift to walk) when sneaking near sites.\n"
                    "• Keep track of ultimate points and enemy economy on the scoreboard.",
                icon: Icons.map_rounded,
              ),

              const SizedBox(height: 16),

              // 7. UTILITY & COMBAT SPENDING
              _buildGuideSectionCard(
                sectionNumber: "07",
                title: "UTILITY USAGE",
                content:
                    "• Never die with full utility—abilities win critical rounds.\n"
                    "• Coordinate flashes and smokes with your entry fraggers.\n"
                    "• Save credits for Full Buy rounds (Rifle + Heavy Shield + Utility).",
                icon: Icons.flash_on_rounded,
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGuideSectionCard({
    required String sectionNumber,
    required String title,
    required String content,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF12181F),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFFFF4654), size: 22),
                const SizedBox(width: 10),
                Text(
                  "$sectionNumber // $title",
                  style: const TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Colors.white, thickness: 1),
            ),
            Text(
              content,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
