import 'package:flutter/material.dart';

class RolesDescriptionScreen extends StatelessWidget {
  const RolesDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C252E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C252E),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "TACTICAL ROLES",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // INTRO BANNER
            Row(
              children: [
                Container(width: 4, height: 18, color: const Color(0xFFFF4654)),
                const SizedBox(width: 8),
                const Text(
                  "// AGENT CLASSIFICATIONS",
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
              "Combat\nRoles",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 32,
                color: Colors.white,
                height: 1.1,
                letterSpacing: 1.0,
              ),
            ),

            const SizedBox(height: 24),

            // DUELIST
            _buildRoleCard(
              title: "DUELIST",
              badge: "ENTRY & FRAGGING",
              iconPath: "assets/logo/duelist_logo.png",
              description:
                  "Self-sufficient fraggers who their team expects, through abilities and skill, to get top kills and procure first bloods.",
              responsibilities: [
                "Create first contact and secure opening kills",
                "Execute aggressively onto bomb sites",
                "Capitalize on space created by Initiators",
              ],
            ),
            const SizedBox(height: 16),

            // INITIATOR
            _buildRoleCard(
              title: "INITIATOR",
              badge: "RECON & DISRUPTION",
              iconPath: "assets/logo/initiator_logo.png",
              description:
                  "Initiators challenge angles by setting up their team to enter contested ground and push defenders away.",
              responsibilities: [
                "Gather intelligence on enemy positions",
                "Flush out defenders using concusses and flashes",
                "Enable Duelists to take site safely",
              ],
            ),
            const SizedBox(height: 16),

            // CONTROLLER
            _buildRoleCard(
              title: "CONTROLLER",
              badge: "MAP & SIGHT BLOCKING",
              iconPath: "assets/logo/controller_logo.png",
              description:
                  "Controllers are experts in slicing up dangerous territory to set their team up for success and choke off lines of sight.",
              responsibilities: [
                "Deploy smokes to block sniper/defender sightlines",
                "Delay enemy pushes during retakes or retries",
                "Dictate map tempo and vision control",
              ],
            ),
            const SizedBox(height: 16),

            // SENTINEL
            _buildRoleCard(
              title: "SENTINEL",
              badge: "DEFENSE & ANCHORING",
              iconPath: "assets/logo/sentinel_logo.png",
              description:
                  "Defensive experts who can lock down areas and watch flanks, both on attacker and defender rounds.",
              responsibilities: [
                "Anchor sites solo against enemy pushes",
                "Watch flanks using traps and tripwires",
                "Slow down opponent rotations and site takes",
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    required String badge,
    required String iconPath,
    required String description,
    required List<String> responsibilities,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF12181F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4654),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageIcon(
                  AssetImage(iconPath),
                  color: Colors.white,
                  size: 24,
                ),
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
                        fontSize: 18,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      badge,
                      style: const TextStyle(
                        fontFamily: 'Valorant',
                        fontSize: 9,
                        color: Color(0xFFFF4654),
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Role Overview
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),

          const Divider(color: Colors.white, height: 1),
          const SizedBox(height: 12),

          // Key Objectives List
          const Text(
            "PRIMARY OBJECTIVES",
            style: TextStyle(
              fontFamily: 'Valorant',
              fontSize: 10,
              color: Color(0xFFFF4654),
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 8),

          ...responsibilities.map(
            (task) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "▸ ",
                    style: TextStyle(
                      color: Color(0xFFFF4654),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      task,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
