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
    "title": "CORE GAMEPLAY & OBJECTIVE",
    "category": "TACTICS",
    "icon": Icons.flag_rounded,
    "content":
        "• 5v5 tactical character shooter where Attackers plant the Spike and Defenders defuse/prevent[cite: 1]. First to 13 round wins[cite: 1].\n"
        "• Spike Timing: Takes 4s to plant, 7s to defuse (3.5s half-defuse checkpoint)[cite: 1]. Ticking speeds up at 20s, 10s, and 5s (45s total)[cite: 1].\n"
        "• Post-Plant: Delay defuses with utility, isolate 1v1 fights in clutches, and set up crossfires[cite: 1]. Use planted Spike as bait[cite: 1].",
  },
  {
    "num": "02",
    "title": "GUNPLAY & RECOIL CONTROL",
    "category": "MECHANICS",
    "icon": Icons.ads_click_rounded,
    "content":
        "• Movement reduces accuracy; stop completely before firing and keep crosshairs at head level[cite: 1].\n"
        "• Tapping & Bursting: Stick to 2–3 bullet bursts at medium to long ranges[cite: 1]. Pull down slowly to control full sprays, allowing time for recoil to reset[cite: 1].\n"
        "• Wallbangs: Surface materials determine penetration (Wood/Boxes are thin)[cite: 1]. Use High-Pen weapons (Odin, Ares, Guardian) to target pinged map locations through walls/smokes[cite: 1].",
  },
  {
    "num": "03",
    "title": "ADVANCED MOVEMENT & PEEKING",
    "category": "MECHANICS",
    "icon": Icons.directions_run_rounded,
    "content":
        "• Counter-Strafing: Use 'A' and 'D' to stop momentum instantly[cite: 1]. Avoid diagonal (W+A/D) peeking into open sightlines[cite: 1].\n"
        "• Peeking Techniques: Use Jiggle Peeking to spot angles, Dead Zoning to fire at velocity shifts, and Jump Peeking to bait sniper shots[cite: 1].\n"
        "• Off-Angles & Slopes: Stand away from walls for perspective advantage[cite: 1]. Hold unexpected off-angles, and adjust crosshair height along map environmental lines when peeking uphill/downhill[cite: 1].",
  },
  {
    "num": "04",
    "title": "ECONOMY & BUY STRATEGIES",
    "category": "ECONOMY",
    "icon": Icons.account_balance_wallet_rounded,
    "content":
        "• Buy Phase Basics: Use round credits to buy guns, shields, and skills[cite: 1]. Always coordinate team buys together[cite: 1].\n"
        "• Loadout Types: Full Buy (~4,500 Creds), Eco/Save (~3,900 Creds min reserved for next round), and Half/Light Buy (Ghost/Sheriff/Spectre + Light Shield)[cite: 1].\n"
        "• Force Buys & Hero Buys: Force buy after losing R1 if enemies didn't upgrade[cite: 1]. Hero buy a Vandal for a top fragger to swing lost momentum[cite: 1].",
  },
  {
    "num": "05",
    "title": "SHIELDS, ULTS & OVERTIME",
    "category": "ECONOMY",
    "icon": Icons.shield_rounded,
    "content":
        "• Armor Math: Heavy Shield (+50 HP, absorbs 66% damage) prevents Phantom 140 HP headshot instakills[cite: 1]. Light Shield (+25 HP for 400 Creds) fits eco rounds[cite: 1].\n"
        "• Ultimate Economy: Secure Ult Orbs early and track enemy scoreboard ultimate points to predict strategies[cite: 1].\n"
        "• Overtime Rules: Everyone gets 5,000 Credits[cite: 1]. Prioritize Heavy Shield + Rifle + Full Utility every single OT round[cite: 1].",
  },
  {
    "num": "06",
    "title": "ROLES & UTILITY INTEGRATION",
    "category": "TEAMWORK",
    "icon": Icons.groups_rounded,
    "content":
        "• Roles: Duelists (Entry), Controllers (Smokes), Initiators (Scout/Flush), Sentinels (Lockdown/Flank)[cite: 1].\n"
        "• Utility Usage: Never die with full utility[cite: 1]. Combine team flashes and smokes with entries, and use cheap utility to force out expensive enemy abilities[cite: 1].\n"
        "• Flank & Lurk: Sentinels cover rear angles with traps[cite: 1]. Attack lurkers stay silent to punish rotations, striking when the main team makes contact[cite: 1].",
  },
  {
    "num": "07",
    "title": "SMOKES, FLASHES & SNIPERS",
    "category": "MECHANICS",
    "icon": Icons.wb_incandescent_rounded,
    "content":
        "• Smoke Placement: Place smokes flush with walls so enemies can't step out hidden, use one-ways for vision advantage, and block chokepoints early[cite: 1].\n"
        "• Flash Etiquette: Call out flashes before casting, pop-flash behind corners, and turn 180° away to dodge incoming enemy flashes[cite: 1].\n"
        "• Operator & Sniping: Change positions immediately after taking a shot, use secondary weapons up close, and use flashes to clear enemy snipers off tight angles[cite: 1].",
  },
  {
    "num": "08",
    "title": "MAP CONTROL & EXECUTION",
    "category": "TACTICS",
    "icon": Icons.map_rounded,
    "content":
        "• Defaults & Fakes: Spread across the map to collect info/utility[cite: 1]. Make noise on one site to draw rotations before hitting the opposite site[cite: 1]. Mid control speeds up rotations[cite: 1].\n"
        "• Anti-Eco Rounds: Hold long-range sightlines against eco teams to prevent close-range Shotgun/Sheriff surprises, and never gift dropped rifles[cite: 1].\n"
        "• Site Retakes: Group up for retakes, save a controller smoke for Spike defusal, and tap the 3.5s half-defuse line to force reactions[cite: 1].",
  },
  {
    "num": "09",
    "title": "AUDIO, INTEL & STEALTH",
    "category": "TACTICS",
    "icon": Icons.volume_up_rounded,
    "content":
        "• Spatial Audio & HRTF: Turn on HRTF settings to pinpoint steps and reloads[cite: 1]. Distinguish distinct surface sounds (metal, wood, snow) and ability cues[cite: 1].\n"
        "• Minimap & Noise: Running, reloading, jumping, and dropping guns ping enemy minimaps[cite: 1]. Shift-walk to stay silent near sites[cite: 1]. Equip knife for speed in safe rotations[cite: 1].\n"
        "• Spike Tricks: Tap defuse to bait peeking enemies or tap twice to mess with clutch mental timing[cite: 1].",
  },
  {
    "num": "10",
    "title": "COMMUNICATION & TEAMWORK",
    "category": "TEAMWORK",
    "icon": Icons.record_voice_over_rounded,
    "content":
        "• Concise Callouts: Call 'Agent + Location + Damage' (e.g., 'Jett A Ramp hit 80')[cite: 1]. Keep comms clear in 1vN clutch scenarios[cite: 1].\n"
        "• Trading & Support: Never push alone—follow entry fraggers closely to trade kills[cite: 1]. Avoid re-peeking identical angles after taking damage[cite: 1].\n"
        "• Track Stats & Mindset: Press TAB during Buy Phase to track enemy weapons, loss bonuses, and ult charges[cite: 1]. Call timeouts and take breaks after two consecutive losses[cite: 1].",
  },
];
