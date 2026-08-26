const List<String> arsenalCategories = [
  "ALL",
  "MELEE",
  "SIDEARMS",
  "SMGs",
  "SHOTGUNS",
  "RIFLES",
  "SNIPERS",
  "HEAVIES",
];

const List<Map<String, dynamic>> arsenalData = [
  // MELEE
  {
    "name": "MELEE",
    "category": "MELEE",
    "icon": "assets/gun_icons/Melee.webp",
    "cost": 0,
    "fireRate": "N/A",
    "magazine": "N/A",
    "headDamage": "N/A",
    "bodyDamage": "N/A",
    "legDamage": "N/A",
    "description":
        "Standard issue combat knife. Silent and deadly in close quarters.",
    "guide":
        "- Primary Fire: Quick slash attack for close-range engagements.\n- Alt-Fire: Heavy swing that deals more damage but is slower.\n- Always faster than any weapon for movement speed.",
  },

  // SIDEARMS
  {
    "name": "CLASSIC",
    "category": "SIDEARMS",
    "icon": "assets/gun_icons/Classic.webp",
    "cost": 0,
    "fireRate": "6.75 rds/s",
    "magazine": "12",
    "headDamage": "78 / 66",
    "bodyDamage": "26 / 22",
    "legDamage": "22 / 18",
    "description":
        "Default sidearm. High jump-burst accuracy makes it effective at close-range eco plays.",
    "guide":
        "- Primary Fire: Tap slowly for medium-range headshots while moving or holding angles.\n- Alt-Fire (Right-Click): Fires a 3-bullet burst. Excellent for right-click jump peeking around close corners on eco rounds.",
  },
  {
    "name": "SHORTY",
    "category": "SIDEARMS",
    "icon": "assets/gun_icons/Shorty.webp",
    "cost": 300,
    "fireRate": "3.33 rds/s",
    "magazine": "2",
    "headDamage": "24 / 16 / 7 per pellet",
    "bodyDamage": "12 / 8 / 3 per pellet",
    "legDamage": "10 / 6 / 2 per pellet",
    "description":
        "Double-barrel sawed-off shotgun. Devastating when holding tight chokepoints.",
    "guide":
        "- Ideal weapon for holding close corners inside smokes (e.g., A Lamps on Bind or Hookah).\n- Pair with an Operator or Sniper loadout as an aggressive close-quarters backup.",
  },
  {
    "name": "FRENZY",
    "category": "SIDEARMS",
    "icon": "assets/gun_icons/Frenzy.webp",
    "cost": 450,
    "fireRate": "10.0 rds/s",
    "magazine": "13",
    "headDamage": "78 / 63",
    "bodyDamage": "26 / 21",
    "legDamage": "22 / 17",
    "description":
        "Fully automatic pistol capable of rapid burst damage on Pistol Rounds.",
    "guide":
        "- Control recoil by pulling down slightly during short 3-4 bullet bursts.\n- Ideal for aggressive entry plays on pistol rounds where mobility and raw fire rate trump long-range taps.",
  },
  {
    "name": "GHOST",
    "category": "SIDEARMS",
    "icon": "assets/gun_icons/Ghost.webp",
    "cost": 500,
    "fireRate": "6.75 rds/s",
    "magazine": "15",
    "headDamage": "105 / 87",
    "bodyDamage": "30 / 25",
    "legDamage": "25 / 21",
    "description":
        "Silenced, high-precision sidearm. One-taps unarmored targets on Pistol Rounds.",
    "guide":
        "- Silenced tracers hide your position when shooting through smokes.\n- Focus on precise headshots; two taps to the head kill light/heavy armor targets cleanly.",
  },
  {
    "name": "BANDIT",
    "category": "SIDEARMS",
    "icon": "assets/gun_icons/Bandit.webp",
    "cost": 600,
    "fireRate": "5.1 rds/s",
    "magazine": "8",
    "headDamage": "152 / 128 / 112",
    "bodyDamage": "39 / 39 / 34",
    "legDamage": "33 / 33 / 28",
    "description":
        "Precision semi-automatic sidearm with powerful close-range headshots and medium wall penetration.",
    "guide":
        "- Best used with deliberate taps and disciplined crosshair placement at short-to-medium range.\n- Strong budget choice between the Ghost and Sheriff; its 8-round magazine punishes missed shots.",
  },
  {
    "name": "SHERIFF",
    "category": "SIDEARMS",
    "icon": "assets/gun_icons/Sheriff.webp",
    "cost": 800,
    "fireRate": "4.0 rds/s",
    "magazine": "6",
    "headDamage": "159 / 145",
    "bodyDamage": "55 / 50",
    "legDamage": "46 / 42",
    "description":
        "High-impact revolver. Delivers instant 1-tap headshot kills up to 30 meters.",
    "guide":
        "- Essential eco weapon. Stop completely before firing to ensure 100% first-bullet accuracy.\n- At 30m+, headshots leave heavy-armored enemies at 5 HP, follow up immediately with a body tap or team trade.",
  },

  // SMGs
  {
    "name": "STINGER",
    "category": "SMGs",
    "icon": "assets/gun_icons/Stinger.webp",
    "cost": 1100,
    "fireRate": "16.0 rds/s",
    "magazine": "20",
    "headDamage": "67 / 62",
    "bodyDamage": "27 / 25",
    "legDamage": "22 / 21",
    "description":
        "Ultra-high fire rate SMG built for rapid close-range meltdowns.",
    "guide":
        "- Run-and-gun viable at point-blank range (0-10m).\n- Use ADS (Aim Down Sights) at medium ranges to trigger a controlled 4-bullet burst mode.",
  },
  {
    "name": "SPECTRE",
    "category": "SMGs",
    "icon": "assets/gun_icons/Spectre.webp",
    "cost": 1600,
    "fireRate": "13.33 rds/s",
    "magazine": "30",
    "headDamage": "78 / 66",
    "bodyDamage": "26 / 22",
    "legDamage": "22 / 18",
    "description":
        "Silenced SMG offering balanced fire rate, control, and mobile accuracy.",
    "guide":
        "- The gold standard anti-eco weapon. Great for moving/strafing mid-range fights against unarmored enemies.\n- Pull down steadily on full spray within 15 meters.",
  },

  // SHOTGUNS
  {
    "name": "BUCKY",
    "category": "SHOTGUNS",
    "icon": "assets/gun_icons/Bucky.webp",
    "cost": 850,
    "fireRate": "1.1 rds/s",
    "magazine": "5",
    "headDamage": "40 / 26 / 18 per pellet",
    "bodyDamage": "20 / 13 / 9 per pellet",
    "legDamage": "17 / 11 / 7 per pellet",
    "description":
        "Pump-action shotgun with primary buckshot and alt-fire canister shots.",
    "guide":
        "- Primary Fire (Left-Click): Devastating at 0-8 meters.\n- Alt-Fire (Right-Click): Fires an air-burst canister that explodes at 8 meters into buckshot; perfect for mid-range chip damage.",
  },
  {
    "name": "JUDGE",
    "category": "SHOTGUNS",
    "icon": "assets/gun_icons/Judge.webp",
    "cost": 1850,
    "fireRate": "3.5 rds/s",
    "magazine": "7",
    "headDamage": "34",
    "bodyDamage": "17 per pellet",
    "legDamage": "14 per pellet",
    "description":
        "Automatic shotgun engineered for point-blank site holds and aggressive pushes.",
    "guide":
        "- Pair with Controller smokes or mobility agents (Raze/Jett) to close gaps instantly.\n- Stand ground in narrow chokepoints during anti-eco rounds.",
  },

  // RIFLES
  {
    "name": "BULLDOG",
    "category": "RIFLES",
    "icon": "assets/gun_icons/Bulldog.webp",
    "cost": 2000,
    "fireRate": "10.0 rds/s",
    "magazine": "24",
    "headDamage": "116",
    "bodyDamage": "35",
    "legDamage": "29",
    "description":
        "Budget rifle featuring full-auto hip fire and 3-round burst ADS.",
    "guide":
        "- Strong half-buy rifle option. Headshot + body shot eliminates heavy armor at any range.\n- Use ADS mode at long angles for tight 3-bullet burst accuracy.",
  },
  {
    "name": "GUARDIAN",
    "category": "RIFLES",
    "icon": "assets/gun_icons/Guardian.webp",
    "cost": 2250,
    "fireRate": "5.25 rds/s",
    "magazine": "12",
    "headDamage": "195",
    "bodyDamage": "65",
    "legDamage": "48",
    "description":
        "Semi-automatic designated marksman rifle. 1-taps through all shields at any distance.",
    "guide":
        "- High Wall Penetration: Superior for wallbang ping tactics through thick obstacles.\n- Requires strict trigger discipline, never panic spray. Focus purely on head-level placement.",
  },
  {
    "name": "PHANTOM",
    "category": "RIFLES",
    "icon": "assets/gun_icons/Phantom.webp",
    "cost": 2900,
    "fireRate": "11.0 rds/s",
    "magazine": "30",
    "headDamage": "156 / 140 / 124",
    "bodyDamage": "39 / 35 / 31",
    "legDamage": "33 / 29 / 26",
    "description":
        "Silenced full-auto rifle. Offers superior spray control, fire rate, and zero bullet tracers.",
    "guide":
        "- Ideal for spraying through Controller smokes without giving away your exact position.\n- Instakills heavy armor (156 HP) up to 15 meters. Excellent for close-to-medium defensive site anchors.",
  },
  {
    "name": "VANDAL",
    "category": "RIFLES",
    "icon": "assets/gun_icons/Vandal.webp",
    "cost": 2900,
    "fireRate": "9.75 rds/s",
    "magazine": "25",
    "headDamage": "160",
    "bodyDamage": "40",
    "legDamage": "34",
    "description":
        "Premier main rifle. Guarantees 1-tap headshot kills at any range.",
    "guide":
        "- Master 2-3 bullet tap and burst firing patterns.\n- Punishes enemy peeks instantly at long sightlines (B Long, Breeze A Main). Avoid long full-sprays due to random recoil dispersion.",
  },

  // SNIPERS
  {
    "name": "MARSHAL",
    "category": "SNIPERS",
    "icon": "assets/gun_icons/Marshal.webp",
    "cost": 950,
    "fireRate": "1.5 rds/s",
    "magazine": "5",
    "headDamage": "202",
    "bodyDamage": "101",
    "legDamage": "85",
    "description": "Lightweight, high-speed lever-action sniper rifle.",
    "guide":
        "- 1-taps unarmored targets to the body (101 DMG) on eco/anti-eco rounds.\n- Outstanding hip-fire accuracy at close ranges when scoped peeks aren't feasible.",
  },
  {
    "name": "OUTLAW",
    "category": "SNIPERS",
    "icon": "assets/gun_icons/Outlaw.webp",
    "cost": 2400,
    "fireRate": "2.75 rds/s",
    "magazine": "2",
    "headDamage": "238",
    "bodyDamage": "140",
    "legDamage": "110",
    "description":
        "Double-barrel medium sniper rifle designed to punish Light Shield meta buys.",
    "guide":
        "- Deals 140 body damage, instantly eliminating enemies who buy Light Shields (125 HP).\n- Fires 2 shots in rapid succession before initiating a full slug reload.",
  },
  {
    "name": "OPERATOR",
    "category": "SNIPERS",
    "icon": "assets/gun_icons/Operator.webp",
    "cost": 4700,
    "fireRate": "0.6 rds/s",
    "magazine": "5",
    "headDamage": "255",
    "bodyDamage": "150",
    "legDamage": "120",
    "description":
        "Heavy bolt-action sniper rifle. One-shots to the head or body at any range.",
    "guide":
        "- Hold tight long-range angles defensively. Change positions after every kill.\n- Always pair with a Ghost/Sheriff or mobility utility for quick escapes when pushed.",
  },

  // HEAVIES
  {
    "name": "ARES",
    "category": "HEAVIES",
    "icon": "assets/gun_icons/Ares.webp",
    "cost": 1600,
    "fireRate": "10.0 to 13.0 rds/s",
    "magazine": "50",
    "headDamage": "72 / 67",
    "bodyDamage": "30 / 28",
    "legDamage": "25 / 23",
    "description":
        "High-penetration light machine gun that ramps up fire rate as you hold the trigger.",
    "guide":
        "- High Wall Penetration: Excellent for spamming pinged choke points through walls.\n- Crouch and hold ADS to stabilize initial recoil spin-up.",
  },
  {
    "name": "ODIN",
    "category": "HEAVIES",
    "icon": "assets/gun_icons/Odin.webp",
    "cost": 3200,
    "fireRate": "12.0 to 15.6 rds/s",
    "magazine": "100",
    "headDamage": "95 / 77",
    "bodyDamage": "38 / 31",
    "legDamage": "32 / 26",
    "description":
        "Massive 100-round LMG delivering relentless suppression and maximum wall penetration.",
    "guide":
        "- Crouch + ADS instantly engages maximum fire rate without recoil spin-up delay.\n- Shreds defensive site holds (Ascent B Main, Fracture Main) when paired with Initiator reveal intel.",
  },
];
