import 'package:flutter/material.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';

class RolesScreen extends StatefulWidget {
  final double bottomOverlayHeight;
  const RolesScreen({super.key, this.bottomOverlayHeight = 0});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _staggerController;
  late final List<Animation<double>> _cardFades;
  late final List<Animation<Offset>> _cardSlides;

  final _roles = [
    {
      "title": "DUELIST",
      "badge": "ENTRY & FRAGGING",
      "iconPath": "assets/logo/duelist_logo.png",
      "description":
          "Self-sufficient fraggers who their team expects, through abilities and skill, to get top kills and procure first bloods.",
      "responsibilities": [
        "Create first contact and secure opening kills",
        "Execute aggressively onto bomb sites",
        "Capitalize on space created by Initiators",
      ],
    },
    {
      "title": "INITIATOR",
      "badge": "RECON & DISRUPTION",
      "iconPath": "assets/logo/initiator_logo.png",
      "description":
          "Initiators challenge angles by setting up their team to enter contested ground and push defenders away.",
      "responsibilities": [
        "Gather intelligence on enemy positions",
        "Flush out defenders using concusses and flashes",
        "Enable Duelists to take site safely",
      ],
    },
    {
      "title": "CONTROLLER",
      "badge": "MAP & SIGHT BLOCKING",
      "iconPath": "assets/logo/controller_logo.png",
      "description":
          "Controllers are experts in slicing up dangerous territory to set their team up for success and choke off lines of sight.",
      "responsibilities": [
        "Deploy smokes to block sniper/defender sightlines",
        "Delay enemy pushes during retakes or retries",
        "Dictate map tempo and vision control",
      ],
    },
    {
      "title": "SENTINEL",
      "badge": "DEFENSE & ANCHORING",
      "iconPath": "assets/logo/sentinel_logo.png",
      "description":
          "Defensive experts who can lock down areas and watch flanks, both on attacker and defender rounds.",
      "responsibilities": [
        "Anchor sites solo against enemy pushes",
        "Watch flanks using traps and tripwires",
        "Slow down opponent rotations and site takes",
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _staggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _cardFades = List.generate(
      _roles.length,
      (i) => CurvedAnimation(
        parent: _staggerController,
        curve: Interval(i * 0.15, (i * 0.15) + 0.4, curve: Curves.easeOut),
      ),
    );

    _cardSlides = List.generate(
      _roles.length,
      (i) => Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _staggerController,
        curve: Interval(i * 0.15, (i * 0.15) + 0.4, curve: Curves.easeOutCubic),
      )),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _staggerController.forward();
    });
  }

  @override
  void dispose() {
    _staggerController.dispose();
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
          "TACTICAL ROLES",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 18,
                      color: AppColors.accent,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "// AGENT CLASSIFICATIONS",
                      style: TextStyle(
                        fontFamily: 'Valorant',
                        fontSize: 12,
                        color: AppColors.accent,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Combat\nRoles",
                  style: TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 32,
                    color: AppColors.textPrimary(brightness),
                    height: 1.1,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, widget.bottomOverlayHeight + 15),
              itemCount: _roles.length,
              itemBuilder: (context, index) {
                final role = _roles[index];
                final animIndex = index;

                return FadeTransition(
                  opacity: _cardFades[animIndex],
                  child: SlideTransition(
                    position: _cardSlides[animIndex],
                    child: _buildRoleCard(
                      brightness: brightness,
                      title: role["title"] as String,
                      badge: role["badge"] as String,
                      iconPath: role["iconPath"] as String,
                      description: role["description"] as String,
                      responsibilities:
                          (role["responsibilities"] as List).cast<String>(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleCard({
    required Brightness brightness,
    required String title,
    required String badge,
    required String iconPath,
    required String description,
    required List<String> responsibilities,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card(brightness),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider(brightness), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accent,
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
                      style: TextStyle(
                        fontFamily: 'Valorant',
                        fontSize: 18,
                        color: AppColors.textPrimary(brightness),
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      badge,
                      style: TextStyle(
                        fontFamily: 'Valorant',
                        fontSize: 9,
                        color: AppColors.accent,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontFamily: 'Gabarito',
              color: AppColors.textSecondary(brightness),
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Divider(color: AppColors.divider(brightness), height: 1),
          const SizedBox(height: 12),
          Text(
            "PRIMARY OBJECTIVES",
            style: TextStyle(
              fontFamily: 'Valorant',
              fontSize: 10,
              color: AppColors.accent,
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
                  Text(
                    "▸ ",
                    style: TextStyle(
                      fontFamily: 'Gabarito',
                      color: AppColors.accent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      task,
                      style: TextStyle(
                        fontFamily: 'Gabarito',
                        color: AppColors.textSecondary(brightness),
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
