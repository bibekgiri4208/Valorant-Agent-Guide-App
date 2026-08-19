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

              const SizedBox(height: 16),

              // 08. ADVANCED ECONOMY (BUY TYPES)
              _buildGuideSectionCard(
                sectionNumber: "08",
                title: "BUY STRATEGIES",
                content:
                    "• Full Buy: Rifle (Vandal/Phantom) + Heavy Shield + Full Utility (~4,500 Creds).\n"
                    "• Eco / Save: Spend minimal cash to ensure a Full Buy next round (~3,900 Creds min next round).\n"
                    "• Half / Light Buy: Buy Ghost/Sheriff/Spectre + Light Shield while saving for next round.",
                icon: Icons.monetization_on_rounded,
              ),

              const SizedBox(height: 16),

              // 09. TRADING & RE-PEEKING
              _buildGuideSectionCard(
                sectionNumber: "09",
                title: "TRADING & TEAMWORK",
                content:
                    "• Never push angles alone; follow entry fraggers closely to trade their deaths.\n"
                    "• Avoid re-peeking the exact same angle after taking damage or losing stealth.\n"
                    "• Coordinate flashes and recon tools with teammates before swinging corners.",
                icon: Icons.sync_alt_rounded,
              ),

              const SizedBox(height: 16),

              // 10. SPIKE & TIME MANAGEMENT
              _buildGuideSectionCard(
                sectionNumber: "10",
                title: "SPIKE & CLOCK",
                content:
                    "• Spike takes 4 seconds to plant and 7 seconds to defuse (3.5s per half defuse checkpoint).\n"
                    "• Defenders: Ticking sound accelerates at 20s, 10s, and 5s before detonation (45s total).\n"
                    "• Attackers: Use the planted Spike as bait; don't take unnecessary fights.",
                icon: Icons.timer_rounded,
              ),

              const SizedBox(height: 16),

              // 11. ANGLE ADVANTAGE & OFF-ANGLES
              _buildGuideSectionCard(
                sectionNumber: "11",
                title: "POSITIONING & ANGLES",
                content:
                    "• Perspective Advantage: Standing farther from a wall lets you see the enemy first.\n"
                    "• Hold unexpected 'off-angles' where enemies don't pre-aim their crosshairs.\n"
                    "• Reposition immediately after securing a kill to avoid counter-trading.",
                icon: Icons.visibility_rounded,
              ),

              const SizedBox(height: 16),

              // 12. MINIMAP & NOISE DISCIPLINE
              _buildGuideSectionCard(
                sectionNumber: "12",
                title: "NOISE & SENSORS",
                content:
                    "• Running, reloading, jumping, and dropping weapons make noise visible on enemy minimaps.\n"
                    "• Keep eyes on the minimap—spotted enemies and dropped Spikes pin instantly.\n"
                    "• Equip your knife when rotating safely across the map to increase movement speed.",
                icon: Icons.volume_up_rounded,
              ),

              const SizedBox(height: 16),

              // 13. DEAD ZONING & JIGGLE PEEKING
              _buildGuideSectionCard(
                sectionNumber: "13",
                title: "ADVANCED MOVEMENT",
                content:
                    "• Jiggle Peek: Tap movement keys quickly to spot angles without exposing your body.\n"
                    "• Dead Zoning: Fire precisely at the instant your movement direction switches velocity.\n"
                    "• Jump Peeking: Jump out sideways and fall back instantly to bait out enemy sniper shots.",
                icon: Icons.directions_run_rounded,
              ),

              const SizedBox(height: 16),

              // 14. RECOIL & SPRAY CONTROL
              _buildGuideSectionCard(
                sectionNumber: "14",
                title: "SPRAY & RECOIL CONTROL",
                content:
                    "• Tapping & Bursting: Stick to 2–3 bullet bursts at medium to long ranges.\n"
                    "• Spray Patterns: Pull down slowly as continuous fire causes bullets to climb.\n"
                    "• Recoil Reset: Briefly pause firing for a fraction of a second to let crosshairs reset.",
                icon: Icons.grain_rounded,
              ),

              const SizedBox(height: 16),

              // 15. POST-PLANT ISOLATION
              _buildGuideSectionCard(
                sectionNumber: "15",
                title: "POST-PLANT PLAYBOOK",
                content:
                    "• Play Time: Focus on delaying defuses with utility rather than chasing gunfights.\n"
                    "• Isolate Fights: In 1v2 clutches, play aggressively to catch enemies off-guard in 1v1s.\n"
                    "• Crossfire Traps: Position with teammates to force defenders to expose themselves to both of you.",
                icon: Icons.security_rounded,
              ),

              const SizedBox(height: 16),

              // 16. RETAKES & SITE RECOVERIES
              _buildGuideSectionCard(
                sectionNumber: "16",
                title: "RETAKE COORDINATION",
                content:
                    "• Group Up: Coordinate site retakes as a team rather than pushing alone.\n"
                    "• Save Smokes: Controllers should save a smoke to cover the Spike during defusal.\n"
                    "• Stick the Half: Always attempt to tap the half-defuse line (3.5s) to force reactions.",
                icon: Icons.published_with_changes_rounded,
              ),

              const SizedBox(height: 16),

              // 17. SHIELD & ARMOR PRIORITY
              _buildGuideSectionCard(
                sectionNumber: "17",
                title: "ARMOR & SHIELD MATH",
                content:
                    "• Heavy Shield: Provides 50 extra HP and absorbs 66% of incoming damage.\n"
                    "• Light Shield: Provides 25 extra HP for 400 credits; ideal for eco or half-buys.\n"
                    "• Rifle Thresholds: Phantom headshots deal 140 damage at range, making Heavy Shield essential.",
                icon: Icons.shield_rounded,
              ),

              const SizedBox(height: 16),

              // 18. AUDIO CUES & HRTF
              _buildGuideSectionCard(
                sectionNumber: "18",
                title: "AUDIO CUES & HRTF",
                content:
                    "• Enable HRTF: Turn on 3D spatial audio in settings to pinpoint footsteps and reloads.\n"
                    "• Surface Sounds: Distinct metal, snow, or wood step sounds pinpoint precise map locations.\n"
                    "• Ability Audio: Listen for unique weapon pulls, agent voice lines, and utility casts.",
                icon: Icons.headphones_rounded,
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
