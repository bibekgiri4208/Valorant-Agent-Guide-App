import 'package:flutter/material.dart';

final List<String> gameGuideCategories = const [
  "ALL",
  "MECHANICS",
  "ECONOMY",
  "TEAMWORK",
  "TACTICS",
];

final List<Map<String, dynamic>> gameGuidesData = const [
  {
    "num": "01",
    "title": "CORE OBJECTIVE",
    "category": "TACTICS",
    "icon": Icons.flag_rounded,
    "content":
        "VALORANT is a 5v5 tactical character-based shooter. Attackers plant the Spike, while Defenders prevent the plant or defuse it. First team to reach 13 round wins takes the victory.",
  },
  {
    "num": "02",
    "title": "ECONOMY SYSTEM",
    "category": "ECONOMY",
    "icon": Icons.account_balance_wallet_rounded,
    "content":
        "At the start of every round, use Credits earned from kills, plants, and round wins to purchase weapons, shields, and Agent utility during the Buy Phase.",
  },
  {
    "num": "03",
    "title": "GUNPLAY & AIMING",
    "category": "MECHANICS",
    "icon": Icons.ads_click_rounded,
    "content":
        "Movement heavily reduces bullet accuracy. Always come to a complete stop before firing. Keep crosshairs at head level for faster reaction times.",
  },
  {
    "num": "04",
    "title": "ROLES & UTILITY",
    "category": "TEAMWORK",
    "icon": Icons.groups_rounded,
    "content":
        "• Duelists: Take first fights and open site entries.\n• Controllers: Block vision with smokes and control territory.\n• Initiators: Flush out enemies and scout positions.\n• Sentinels: Lock down sites and secure flanks.",
  },
  {
    "num": "05",
    "title": "CROSSHAIR & PEEKING",
    "category": "MECHANICS",
    "icon": Icons.center_focus_strong_rounded,
    "content":
        "• Pre-aim common enemy head-height angles before rounding corners.\n• Use 'A' and 'D' keys to counter-strafe and stop momentum instantly.\n• Avoid diagonal peeking (W+A/D) into open sightlines.",
  },
  {
    "num": "06",
    "title": "MAP & INTEL",
    "category": "TACTICS",
    "icon": Icons.map_rounded,
    "content":
        "• Call out enemy locations using precise minimap location names.\n• Use noise control (hold Shift to walk) when sneaking near sites.\n• Keep track of ultimate points and enemy economy on the scoreboard.",
  },
  {
    "num": "07",
    "title": "UTILITY USAGE",
    "category": "TEAMWORK",
    "icon": Icons.flash_on_rounded,
    "content":
        "• Never die with full utility—abilities win critical rounds.\n• Coordinate flashes and smokes with your entry fraggers.\n• Save credits for Full Buy rounds (Rifle + Heavy Shield + Utility).",
  },
  {
    "num": "08",
    "title": "BUY STRATEGIES",
    "category": "ECONOMY",
    "icon": Icons.monetization_on_rounded,
    "content":
        "• Full Buy: Rifle (Vandal/Phantom) + Heavy Shield + Full Utility (~4,500 Creds).\n• Eco / Save: Spend minimal cash to ensure a Full Buy next round (~3,900 Creds min next round).\n• Half / Light Buy: Buy Ghost/Sheriff/Spectre + Light Shield while saving for next round.",
  },
  {
    "num": "09",
    "title": "TRADING & TEAMWORK",
    "category": "TEAMWORK",
    "icon": Icons.sync_alt_rounded,
    "content":
        "• Never push angles alone; follow entry fraggers closely to trade their deaths.\n• Avoid re-peeking the exact same angle after taking damage or losing stealth.\n• Coordinate flashes and recon tools with teammates before swinging corners.",
  },
  {
    "num": "10",
    "title": "SPIKE & CLOCK",
    "category": "TACTICS",
    "icon": Icons.timer_rounded,
    "content":
        "• Spike takes 4 seconds to plant and 7 seconds to defuse (3.5s per half defuse checkpoint).\n• Defenders: Ticking sound accelerates at 20s, 10s, and 5s before detonation (45s total).\n• Attackers: Use the planted Spike as bait; don't take unnecessary fights.",
  },
  {
    "num": "11",
    "title": "POSITIONING & ANGLES",
    "category": "MECHANICS",
    "icon": Icons.visibility_rounded,
    "content":
        "• Perspective Advantage: Standing farther from a wall lets you see the enemy first.\n• Hold unexpected 'off-angles' where enemies don't pre-aim their crosshairs.\n• Reposition immediately after securing a kill to avoid counter-trading.",
  },
  {
    "num": "12",
    "title": "NOISE & SENSORS",
    "category": "TACTICS",
    "icon": Icons.volume_up_rounded,
    "content":
        "• Running, reloading, jumping, and dropping weapons make noise visible on enemy minimaps.\n• Keep eyes on the minimap—spotted enemies and dropped Spikes pin instantly.\n• Equip your knife when rotating safely across the map to increase movement speed.",
  },
  {
    "num": "13",
    "title": "ADVANCED MOVEMENT",
    "category": "MECHANICS",
    "icon": Icons.directions_run_rounded,
    "content":
        "• Jiggle Peek: Tap movement keys quickly to spot angles without exposing your body.\n• Dead Zoning: Fire precisely at the instant your movement direction switches velocity.\n• Jump Peeking: Jump out sideways and fall back instantly to bait out enemy sniper shots.",
  },
  {
    "num": "14",
    "title": "SPRAY & RECOIL CONTROL",
    "category": "MECHANICS",
    "icon": Icons.grain_rounded,
    "content":
        "• Tapping & Bursting: Stick to 2–3 bullet bursts at medium to long ranges.\n• Spray Patterns: Pull down slowly as continuous fire causes bullets to climb.\n• Recoil Reset: Briefly pause firing for a fraction of a second to let crosshairs reset.",
  },
  {
    "num": "15",
    "title": "POST-PLANT PLAYBOOK",
    "category": "TACTICS",
    "icon": Icons.security_rounded,
    "content":
        "• Play Time: Focus on delaying defuses with utility rather than chasing gunfights.\n• Isolate Fights: In 1v2 clutches, play aggressively to catch enemies off-guard in 1v1s.\n• Crossfire Traps: Position with teammates to force defenders to expose themselves to both of you.",
  },
  {
    "num": "16",
    "title": "RETAKE COORDINATION",
    "category": "TEAMWORK",
    "icon": Icons.published_with_changes_rounded,
    "content":
        "• Group Up: Coordinate site retakes as a team rather than pushing alone.\n• Save Smokes: Controllers should save a smoke to cover the Spike during defusal.\n• Stick the Half: Always attempt to tap the half-defuse line (3.5s) to force reactions.",
  },
  {
    "num": "17",
    "title": "ARMOR & SHIELD MATH",
    "category": "ECONOMY",
    "icon": Icons.shield_rounded,
    "content":
        "• Heavy Shield: Provides 50 extra HP and absorbs 66% of incoming damage.\n• Light Shield: Provides 25 extra HP for 400 credits; ideal for eco or half-buys.\n• Rifle Thresholds: Phantom headshots deal 140 damage at range, making Heavy Shield essential.",
  },
  {
    "num": "18",
    "title": "AUDIO CUES & HRTF",
    "category": "MECHANICS",
    "icon": Icons.headphones_rounded,
    "content":
        "• Enable HRTF: Turn on 3D spatial audio in settings to pinpoint footsteps and reloads.\n• Surface Sounds: Distinct metal, snow, or wood step sounds pinpoint precise map locations.\n• Ability Audio: Listen for unique weapon pulls, agent voice lines, and utility casts.",
  },
];
