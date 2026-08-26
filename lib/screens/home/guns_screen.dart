import 'package:flutter/material.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';

class GunsScreen extends StatefulWidget {
  final double bottomOverlayHeight;
  const GunsScreen({super.key, this.bottomOverlayHeight = 0});

  @override
  State<GunsScreen> createState() => _GunsScreenState();
}

class _GunsScreenState extends State<GunsScreen> {
  String _selectedCategory = "ALL";
  String _searchQuery = "";

  final List<String> categories = const [
    "ALL",
    "SIDEARMS",
    "SMGs",
    "SHOTGUNS",
    "RIFLES",
    "SNIPERS",
    "HEAVIES",
  ];

  final List<Map<String, dynamic>> gunsData = const [
    // SIDEARMS
    {
      "name": "CLASSIC",
      "category": "SIDEARMS",
      "cost": 0,
      "fireRate": "6.75 rds/s",
      "magazine": "12",
      "headDamage": "78 / 66",
      "bodyDamage": "26 / 22",
      "legDamage": "22 / 18",
      "description": "Default sidearm. High jump-burst accuracy makes it effective at close-range eco plays.",
      "guide": "- Primary Fire: Tap slowly for medium-range headshots while moving or holding angles.\n- Alt-Fire (Right-Click): Fires a 3-bullet burst. Excellent for right-click jump peeking around close corners on eco rounds.",
    },
    {
      "name": "SHORTY",
      "category": "SIDEARMS",
      "cost": 300,
      "fireRate": "3.33 rds/s",
      "magazine": "2",
      "headDamage": "22",
      "bodyDamage": "11 per pellet",
      "legDamage": "9 per pellet",
      "description": "Double-barrel sawed-off shotgun. Devastating when holding tight chokepoints.",
      "guide": "- Ideal weapon for holding close corners inside smokes (e.g., A Lamps on Bind or Hookah).\n- Pair with an Operator or Sniper loadout as an aggressive close-quarters backup.",
    },
    {
      "name": "FRENZY",
      "category": "SIDEARMS",
      "cost": 450,
      "fireRate": "10.0 rds/s",
      "magazine": "13",
      "headDamage": "78 / 63",
      "bodyDamage": "26 / 21",
      "legDamage": "22 / 17",
      "description": "Fully automatic pistol capable of rapid burst damage on Pistol Rounds.",
      "guide": "- Control recoil by pulling down slightly during short 3-4 bullet bursts.\n- Ideal for aggressive entry plays on pistol rounds where mobility and raw fire rate trump long-range taps.",
    },
    {
      "name": "GHOST",
      "category": "SIDEARMS",
      "cost": 500,
      "fireRate": "6.75 rds/s",
      "magazine": "15",
      "headDamage": "105 / 88",
      "bodyDamage": "33 / 28",
      "legDamage": "28 / 23",
      "description": "Silenced, high-precision sidearm. One-taps unarmored targets on Pistol Rounds.",
      "guide": "- Silenced tracers hide your position when shooting through smokes.\n- Focus on precise headshots; two taps to the head kill light/heavy armor targets cleanly.",
    },
    {
      "name": "SHERIFF",
      "category": "SIDEARMS",
      "cost": 800,
      "fireRate": "4.0 rds/s",
      "magazine": "6",
      "headDamage": "159 / 145",
      "bodyDamage": "55 / 50",
      "legDamage": "46 / 42",
      "description": "High-impact revolver. Delivers instant 1-tap headshot kills up to 30 meters.",
      "guide": "- Essential eco weapon. Stop completely before firing to ensure 100% first-bullet accuracy.\n- At 30m+, headshots leave heavy-armored enemies at 5 HP, follow up immediately with a body tap or team trade.",
    },

    // SMGs
    {
      "name": "STINGER",
      "category": "SMGs",
      "cost": 1100,
      "fireRate": "16.0 rds/s",
      "magazine": "20",
      "headDamage": "67 / 57",
      "bodyDamage": "27 / 23",
      "legDamage": "22 / 19",
      "description": "Ultra-high fire rate SMG built for rapid close-range meltdowns.",
      "guide": "- Run-and-gun viable at point-blank range (0-10m).\n- Use ADS (Aim Down Sights) at medium ranges to trigger a controlled 4-bullet burst mode.",
    },
    {
      "name": "SPECTRE",
      "category": "SMGs",
      "cost": 1600,
      "fireRate": "13.33 rds/s",
      "magazine": "30",
      "headDamage": "78 / 66",
      "bodyDamage": "26 / 22",
      "legDamage": "22 / 18",
      "description": "Silenced SMG offering balanced fire rate, control, and mobile accuracy.",
      "guide": "- The gold standard anti-eco weapon. Great for moving/strafing mid-range fights against unarmored enemies.\n- Pull down steadily on full spray within 15 meters.",
    },

    // SHOTGUNS
    {
      "name": "BUCKY",
      "category": "SHOTGUNS",
      "cost": 850,
      "fireRate": "1.1 rds/s",
      "magazine": "5",
      "headDamage": "44",
      "bodyDamage": "22 per pellet",
      "legDamage": "18 per pellet",
      "description": "Pump-action shotgun with primary buckshot and alt-fire canister shots.",
      "guide": "- Primary Fire (Left-Click): Devastating at 0-8 meters.\n- Alt-Fire (Right-Click): Fires an air-burst canister that explodes at 8 meters into buckshot; perfect for mid-range chip damage.",
    },
    {
      "name": "JUDGE",
      "category": "SHOTGUNS",
      "cost": 1850,
      "fireRate": "3.5 rds/s",
      "magazine": "7",
      "headDamage": "34",
      "bodyDamage": "17 per pellet",
      "legDamage": "14 per pellet",
      "description": "Automatic shotgun engineered for point-blank site holds and aggressive pushes.",
      "guide": "- Pair with Controller smokes or mobility agents (Raze/Jett) to close gaps instantly.\n- Stand ground in narrow chokepoints during anti-eco rounds.",
    },

    // RIFLES
    {
      "name": "BULLDOG",
      "category": "RIFLES",
      "cost": 2000,
      "fireRate": "10.0 rds/s",
      "magazine": "24",
      "headDamage": "115",
      "bodyDamage": "35",
      "legDamage": "29",
      "description": "Budget rifle featuring full-auto hip fire and 3-round burst ADS.",
      "guide": "- Strong half-buy rifle option. Headshot + body shot eliminates heavy armor at any range.\n- Use ADS mode at long angles for tight 3-bullet burst accuracy.",
    },
    {
      "name": "GUARDIAN",
      "category": "RIFLES",
      "cost": 2250,
      "fireRate": "5.25 rds/s",
      "magazine": "12",
      "headDamage": "195",
      "bodyDamage": "65",
      "legDamage": "48",
      "description": "Semi-automatic designated marksman rifle. 1-taps through all shields at any distance.",
      "guide": "- High Wall Penetration: Superior for wallbang ping tactics through thick obstacles.\n- Requires strict trigger discipline, never panic spray. Focus purely on head-level placement.",
    },
    {
      "name": "PHANTOM",
      "category": "RIFLES",
      "cost": 2900,
      "fireRate": "11.0 rds/s",
      "magazine": "30",
      "headDamage": "156 / 140 / 124",
      "bodyDamage": "39 / 35 / 31",
      "legDamage": "33 / 29 / 26",
      "description": "Silenced full-auto rifle. Offers superior spray control, fire rate, and zero bullet tracers.",
      "guide": "- Ideal for spraying through Controller smokes without giving away your exact position.\n- Instakills heavy armor (156 HP) up to 15 meters. Excellent for close-to-medium defensive site anchors.",
    },
    {
      "name": "VANDAL",
      "category": "RIFLES",
      "cost": 2900,
      "fireRate": "9.75 rds/s",
      "magazine": "25",
      "headDamage": "160",
      "bodyDamage": "40",
      "legDamage": "34",
      "description": "Premier main rifle. Guarantees 1-tap headshot kills at any range.",
      "guide": "- Master 2-3 bullet tap and burst firing patterns.\n- Punishes enemy peeks instantly at long sightlines (B Long, Breeze A Main). Avoid long full-sprays due to random recoil dispersion.",
    },

    // SNIPERS
    {
      "name": "MARSHAL",
      "category": "SNIPERS",
      "cost": 950,
      "fireRate": "1.5 rds/s",
      "magazine": "5",
      "headDamage": "202",
      "bodyDamage": "101",
      "legDamage": "85",
      "description": "Lightweight, high-speed lever-action sniper rifle.",
      "guide": "- 1-taps unarmored targets to the body (101 DMG) on eco/anti-eco rounds.\n- Outstanding hip-fire accuracy at close ranges when scoped peeks aren't feasible.",
    },
    {
      "name": "OUTLAW",
      "category": "SNIPERS",
      "cost": 2400,
      "fireRate": "2.75 rds/s",
      "magazine": "2",
      "headDamage": "238",
      "bodyDamage": "140",
      "legDamage": "119",
      "description": "Double-barrel medium sniper rifle designed to punish Light Shield meta buys.",
      "guide": "- Deals 140 body damage, instantly eliminating enemies who buy Light Shields (125 HP).\n- Fires 2 shots in rapid succession before initiating a full slug reload.",
    },
    {
      "name": "OPERATOR",
      "category": "SNIPERS",
      "cost": 4700,
      "fireRate": "0.6 rds/s",
      "magazine": "5",
      "headDamage": "255",
      "bodyDamage": "150",
      "legDamage": "120",
      "description": "Heavy bolt-action sniper rifle. One-shots to the head or body at any range.",
      "guide": "- Hold tight long-range angles defensively. Change positions after every kill.\n- Always pair with a Ghost/Sheriff or mobility utility for quick escapes when pushed.",
    },

    // HEAVIES
    {
      "name": "ARES",
      "category": "HEAVIES",
      "cost": 1600,
      "fireRate": "10.0 to 13.0 rds/s",
      "magazine": "50",
      "headDamage": "72 / 67",
      "bodyDamage": "30 / 28",
      "legDamage": "25 / 23",
      "description": "High-penetration light machine gun that ramps up fire rate as you hold the trigger.",
      "guide": "- High Wall Penetration: Excellent for spamming pinged choke points through walls.\n- Crouch and hold ADS to stabilize initial recoil spin-up.",
    },
    {
      "name": "ODIN",
      "category": "HEAVIES",
      "cost": 3200,
      "fireRate": "12.0 to 15.0 rds/s",
      "magazine": "100",
      "headDamage": "95 / 77",
      "bodyDamage": "38 / 31",
      "legDamage": "32 / 26",
      "description": "Massive 100-round LMG delivering relentless suppression and maximum wall penetration.",
      "guide": "- Crouch + ADS instantly engages maximum fire rate without recoil spin-up delay.\n- Shreds defensive site holds (Ascent B Main, Fracture Main) when paired with Initiator reveal intel.",
    },
  ];

  List<Map<String, dynamic>> get _filteredGuns {
    return gunsData.where((gun) {
      final matchesCategory =
          _selectedCategory == "ALL" || gun['category'] == _selectedCategory;
      final matchesSearch =
          gun['name'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          gun['description'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
      return matchesCategory && matchesSearch;
    }).toList();
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
          "ARSENAL",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 2.0,
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
                      "// WEAPON DATABASE",
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
                  "TACTICAL\nARSENAL",
                  style: TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 28,
                    color: AppColors.textPrimary(brightness),
                    height: 1.15,
                    letterSpacing: 1.0,
                    shadows: const [
                      Shadow(
                        color: Colors.black54,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) => setState(() => _searchQuery = value),
                  style: TextStyle(
                    fontFamily: 'Gabarito',
                    color: AppColors.textPrimary(brightness),
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search weapons...",
                    hintStyle: TextStyle(
                      fontFamily: 'Gabarito',
                      color: AppColors.textSecondary(brightness),
                      fontSize: 13,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.accent,
                    ),
                    suffixIcon: PopupMenuButton<String>(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _selectedCategory != "ALL"
                              ? AppColors.accent.withValues(alpha: 0.15)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.filter_list_rounded,
                          color: _selectedCategory != "ALL"
                              ? AppColors.accent
                              : AppColors.textSecondary(brightness),
                          size: 22,
                        ),
                      ),
                      color: AppColors.card(brightness),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: AppColors.divider(brightness)),
                      ),
                      onSelected: (value) {
                        setState(() => _selectedCategory = value);
                      },
                      itemBuilder: (context) {
                        return categories.map((category) {
                          final isSelected = _selectedCategory == category;
                          return PopupMenuItem<String>(
                            value: category,
                            child: Row(
                              children: [
                                if (isSelected)
                                  Icon(Icons.check, color: AppColors.accent, size: 18)
                                else
                                  const SizedBox(width: 18),
                                const SizedBox(width: 10),
                                Text(
                                  category,
                                  style: TextStyle(
                                    fontFamily: 'Valorant',
                                    fontSize: 12,
                                    color: isSelected
                                        ? AppColors.accent
                                        : AppColors.textPrimary(brightness),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList();
                      },
                    ),
                    filled: true,
                    fillColor: AppColors.card(brightness),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.divider(brightness)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.accent),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: _filteredGuns.isEmpty
                ? Center(
                    child: Text(
                      "NO WEAPONS FOUND",
                      style: TextStyle(
                        color: AppColors.textSecondary(brightness),
                        fontFamily: 'Valorant',
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, widget.bottomOverlayHeight + 20),
                    itemCount: _filteredGuns.length,
                    itemBuilder: (context, index) {
                      return _GunCard(
                        gun: _filteredGuns[index],
                        brightness: brightness,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _GunCard extends StatefulWidget {
  final Map<String, dynamic> gun;
  final Brightness brightness;

  const _GunCard({
    required this.gun,
    required this.brightness,
  });

  @override
  State<_GunCard> createState() => _GunCardState();
}

class _GunCardState extends State<_GunCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final brightness = widget.brightness;
    final gun = widget.gun;

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.card(brightness),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _expanded
                ? AppColors.accent.withValues(alpha: 0.4)
                : AppColors.divider(brightness),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.gps_fixed_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gun['name'],
                          style: TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 14,
                            color: AppColors.textPrimary(brightness),
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.accent.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                gun['category'],
                                style: TextStyle(
                                  fontFamily: 'Valorant',
                                  fontSize: 8,
                                  color: AppColors.accent,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "${gun['cost']} CREDITS",
                              style: TextStyle(
                                fontFamily: 'Gabarito',
                                fontSize: 10,
                                color: AppColors.textSecondary(brightness),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textSecondary(brightness),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            // STATS ROW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatChip("HEAD", gun['headDamage'], brightness),
                  _buildStatChip("BODY", gun['bodyDamage'], brightness),
                  _buildStatChip("LEG", gun['legDamage'], brightness),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // EXPANDED CONTENT
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: _expanded
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: AppColors.divider(brightness), thickness: 1),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              _buildMiniStat("MAG", gun['magazine'], brightness),
                              const SizedBox(width: 16),
                              _buildMiniStat("FIRE RATE", gun['fireRate'], brightness),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            gun['description'],
                            style: TextStyle(
                              fontFamily: 'Gabarito',
                              color: AppColors.textSecondary(brightness),
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.scaffold(brightness),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.divider(brightness),
                              ),
                            ),
                            child: Text(
                              gun['guide'],
                              style: TextStyle(
                                fontFamily: 'Gabarito',
                                color: AppColors.textSecondary(brightness),
                                fontSize: 11,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip(String label, String value, Brightness brightness) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Gabarito',
              fontSize: 10,
              color: AppColors.textPrimary(brightness),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Valorant',
              fontSize: 8,
              color: AppColors.accent,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(String label, String value, Brightness brightness) {
    return Row(
      children: [
        Text(
          "$label: ",
          style: TextStyle(
            fontFamily: 'Valorant',
            fontSize: 9,
            color: AppColors.textSecondary(brightness),
            letterSpacing: 0.5,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Gabarito',
            fontSize: 11,
            color: AppColors.textPrimary(brightness),
          ),
        ),
      ],
    );
  }
}
