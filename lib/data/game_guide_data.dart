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
  {
    "num": "19",
    "title": "ULTIMATE ECONOMY & ORBS",
    "category": "ECONOMY",
    "icon": Icons.stars_rounded,
    "content":
        "• Collect Orbs: Secure Ult Orbs early to build impact ultimates faster.\n• Track Enemy Ults: Check the scoreboard before rounds to predict enemy pushes (e.g., Breach/Fade ults).\n• Ult Synergies: Combine crowd-control ultimates with high-damage abilities.",
  },
  {
    "num": "20",
    "title": "SNIPER & OPERATOR RULES",
    "category": "MECHANICS",
    "icon": Icons.gps_fixed_rounded,
    "content":
        "• One Shot, Move: Change positions after firing an Operator shot to prevent trade-kills.\n• Flash First: Use team utility to force an enemy sniper off tight angles.\n• Avoid Close Range: Swap to secondary weapons (Classic/Ghost/Sheriff) in tight corners.",
  },
  {
    "num": "21",
    "title": "PISTOL ROUND PRIORITY",
    "category": "ECONOMY",
    "icon": Icons.ads_click_outlined,
    "content":
        "• Buy Utility & Ghost/Armor: Prioritize core agent utility or Ghost + Light Shield combos.\n• Team Stacking: Stick together on pistol rounds as body shots scale well in group trades.\n• Second Round Win Bonus: If you win Round 1, full buy SMGs/Armor to cement momentum.",
  },
  {
    "num": "22",
    "title": "DEFAULT & FAKE SETUPS",
    "category": "TACTICS",
    "icon": Icons.alt_route_rounded,
    "content":
        "• Play Defaults: Spread across the map to collect information and force defender utility.\n• Execute Fakes: Make heavy noise at one site with utility to draw rotations, then hit the opposite site.\n• Mid Control: Controlling middle map sections cuts down rotation times for quick hits.",
  },
  {
    "num": "23",
    "title": "SMOKE PLACEMENT",
    "category": "TACTICS",
    "icon": Icons.cloud_rounded,
    "content":
        "• Flush Smokes: Place smokes flush with wall edges so enemies can't step out hidden.\n• One-Way Smokes: Position smokes higher to see enemy feet before they see your body.\n• Chokepoint Blocking: Smoke entry lanes early to delay aggressive enemy rushes.",
  },
  {
    "num": "24",
    "title": "COMMUNICATION PROTOCOL",
    "category": "TEAMWORK",
    "icon": Icons.record_voice_over_rounded,
    "content":
        "• Keep Callouts Concise: State 'Agent + Location + Health' (e.g., 'Jett A Ramp hit 80').\n• Clear Comms in Clutches: Avoid talking during 1vN situations to let your teammate hear footstep audio.\n• Positive Reinforcement: Maintain team morale after lost rounds to avoid tilt.",
  },
  {
    "num": "25",
    "title": "FLANK & LURK ROLES",
    "category": "TACTICS",
    "icon": Icons.directions_walk_rounded,
    "content":
        "• Control Flanks: Sentinels should leave traps (Tripwires/Alarmbots) to cover team rear angles.\n• Silent Lurking: Attackers can send one player to quietly hold push-outs and punish rotations.\n• Timing is Key: Only strike as a lurker when your team makes contact on the main site execute.",
  },
  {
    "num": "26",
    "title": "MENTAL & RESET",
    "category": "TEAMWORK",
    "icon": Icons.psychology_rounded,
    "content":
        "• Tactical Timeouts: Call a vote to reset team focus after losing 3–4 consecutive rounds.\n• Focus Next Round: Don't dwell on mistakes; adapt setups based on enemy habits.\n• Take Breaks: Pause playing after two consecutive losses to prevent fatigue and tilt.",
  },
  {
    "num": "27",
    "title": "WALLBANGS & PENETRATION",
    "category": "MECHANICS",
    "icon": Icons.border_clear_rounded,
    "content":
        "• Bullet Penetration: Weapons have Low, Medium, or High wall penetration ratings.\n• Paper Thin Surfaces: Wood, boxes, and thin walls allow high penetration guns (Odin, Ares, Guardian) to deal heavy damage.\n• Crosshair Ping: Mark default plant spots on the map to spam through smokes or thin walls accurately.",
  },
  {
    "num": "28",
    "title": "FORCE BUY TIMING",
    "category": "ECONOMY",
    "icon": Icons.shopping_cart_checkout_rounded,
    "content":
        "• Catch Opponents Off-Guard: Force buy after losing Round 1 if the enemy team didn't upgrade their weapons.\n• Match Team Economy: Never force buy individually—always coordinate with your team so everyone buys together.\n• Hero Buys: Buying one rifle (Vandal) for a top fragger while teammates save can turn a losing round.",
  },
  {
    "num": "29",
    "title": "FLASH ETIQUETTE & DODGING",
    "category": "MECHANICS",
    "icon": Icons.wb_incandescent_rounded,
    "content":
        "• Look Away: Turn your crosshair 180° away from an incoming flash to minimize blind duration.\n• Call Before Flashing: Alert teammates verbally before popping flashes over walls or around corners.\n• Pop Flashes: Detonate flashes directly behind corners so enemies have zero reaction time.",
  },
  {
    "num": "30",
    "title": "SPIKE BAITING & CLUTCH",
    "category": "TACTICS",
    "icon": Icons.touch_app_rounded,
    "content":
        "• Tap & Hold: Tap the Spike to trigger the defuse sound cue, then immediately swing to catch peeking enemies.\n• Fake Fake Defuse: Tap the Spike twice to mess with the enemy’s mental timing during 1v1 clutches.\n• Ninja Defuse: Hide inside smokes with light armor/classic in early round chaos to defuse silently.",
  },
  {
    "num": "31",
    "title": "ABILITY TRADING",
    "category": "TEAMWORK",
    "icon": Icons.swap_calls_rounded,
    "content":
        "• Force Utility Out: Use cheap abilities (Sova Dart, Fade Haunt) to force out expensive enemy smokes or mollies.\n• Counter-Utility: Deploy stalling abilities (Sage Wall, Killjoy Nanoswarms) the moment attackers make contact.\n• Save Ult Recharges: Keep track of abilities that recharge on kills (e.g., Jett Dash, Raze Paint Shells).",
  },
  {
    "num": "32",
    "title": "MAP CONTROL & ROTATIONS",
    "category": "TACTICS",
    "icon": Icons.compare_arrows_rounded,
    "content":
        "• Anchor Sites: Sentinels should solo-anchor a site to free up 4 teammates for aggressive mid-map control.\n• Rotate Smart: Don't leave a site completely open on the first audio cue; confirm Spike presence first.\n• Fast Knife Rotations: Rotate with your knife out through safe, team-controlled territory to save crucial seconds.",
  },
  {
    "num": "33",
    "title": "DAMAGE MAPPING & OVERTIME",
    "category": "ECONOMY",
    "icon": Icons.calculate_rounded,
    "content":
        "• Overtime Credits: Every player receives 5,000 Credits at the start of Overtime rounds.\n• Always Heavy Shield: In Overtime, prioritize Heavy Shield + Rifle + Full Utility every single round.\n• Track Damage Output: Press TAB or check combat reports to call out 'hit for 120' so teammates can body-shot trade.",
  },
  {
    "num": "34",
    "title": "CROSSHAIR PLACEMENT ON SLOPES",
    "category": "MECHANICS",
    "icon": Icons.terrain_rounded,
    "content":
        "• Adjust for Elevation: Align crosshairs with map environmental lines (stripes, wall trim) on stairs and ramps.\n• Peeking Upwards: Aim slightly higher when peeking uphill angles to account for head positions.\n• Peeking Downwards: Pre-aim lower when pushing down ramps like A Sewer or B Main entryways.",
  },
  {
    "num": "35",
    "title": "ANTICO-ECO ROUND EXECUTION",
    "category": "TACTICS",
    "icon": Icons.gavel_rounded,
    "content":
        "• Maintain Distance: Hold long range sightlines with rifles when playing against enemy eco/pistol rounds.\n• Avoid Close Corners: Don't push tight spaces where enemy Shotguns (Judge/Bucky) or Sheriffs excel.\n• Don't Gift Rifles: Avoid dying alone in aggressive positions so enemies cannot grab your dropped Vandal.",
  },
  {
    "num": "36",
    "title": "SCOREBOARD & COMP TRACKING",
    "category": "TEAMWORK",
    "icon": Icons.leaderboard_rounded,
    "content":
        "• Check Enemy Loadouts: View enemy weapons during Buy Phase to spot Operator purchases or eco saves.\n• Ult Charge Alert: Notice when enemies have high-impact ultimates (Cypher, Sova, Phoenix) ready to pop.\n• Track Loss Bonuses: Calculate if enemies are on a \$1,900, \$2,400, or \$2,900 loss streak bonus.",
  },
];
