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
    "bodyDamage": "50 / 75",
    "legDamage": "50 / 75",
    "description":
        "Standard issue tactical knife. Fast, silent, and always available.",
    "guide":
        "- Primary Fire: 50 damage from the front, 100 damage from behind.\n"
        "- Alt-Fire: 75 damage from the front, 150 damage from behind.\n"
        "- Knife attacks are silent and require no ammunition.\n"
        "- Melee provides the fastest standard movement speed.",
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
        "Free semi-automatic sidearm with a three-round burst alternate fire.",
    "guide":
        "- Primary Fire: Accurate semi-automatic shots.\n"
        "- Alt-Fire: Fires a three-round burst with increased close-range burst potential.\n"
        "- Excellent pistol-round weapon when combined with Light Shields and abilities.\n"
        "- Avoid relying on burst fire at longer ranges.",
  },

  {
    "name": "SHORTY",
    "category": "SIDEARMS",
    "icon": "assets/gun_icons/Shorty.webp",
    "cost": 300,
    "fireRate": "3.0 rds/s",
    "magazine": "2",
    "headDamage": "22",
    "bodyDamage": "11 per pellet",
    "legDamage": "9 per pellet",
    "description":
        "Compact double-barrel shotgun designed for devastating close-range ambushes.",
    "guide":
        "- Extremely effective inside smokes and around tight corners.\n"
        "- Use it to punish enemies who clear close angles carelessly.\n"
        "- Pair with an Operator or another expensive weapon as a cheap close-range backup.\n"
        "- Avoid relying on jumping or moving shots.",
  },

  {
    "name": "FRENZY",
    "category": "SIDEARMS",
    "icon": "assets/gun_icons/Frenzy.webp",
    "cost": 450,
    "fireRate": "10.0 rds/s",
    "magazine": "15",
    "headDamage": "78 / 63",
    "bodyDamage": "26 / 21",
    "legDamage": "22 / 17",
    "description":
        "Fully automatic pistol built for aggressive close-range engagements.",
    "guide":
        "- Excellent for aggressive pistol-round entries and close-range fights.\n"
        "- Control recoil with short bursts at medium range.\n"
        "- High fire rate makes it forgiving at close distance.\n"
        "- Avoid extended sprays at long range.",
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
        "Accurate silenced sidearm with strong first-shot precision and low recoil.",
    "guide":
        "- Excellent pistol-round choice when prioritizing accuracy.\n"
        "- One-taps unarmored enemies to the head at all ranges.\n"
        "- Use controlled taps at longer distances.\n"
        "- Silenced shots make it harder for enemies to immediately locate you.",
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
        "Precision semi-automatic sidearm positioned between the Ghost and Sheriff.",
    "guide":
        "- 0-10m: 152 head / 39 body / 33 legs.\n"
        "- 10-30m: 128 head / 39 body / 33 legs.\n"
        "- 30-50m: 112 head / 34 body / 28 legs.\n"
        "- Rewards precise tapping rather than spraying.\n"
        "- Eight-round magazine makes missed shots costly.",
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
        "High-powered revolver capable of one-shot headshots at every range.",
    "guide":
        "- Headshots kill fully armored enemies at any range.\n"
        "- From 30m onward, headshot damage drops to 145.\n"
        "- Stop moving before firing for maximum accuracy.\n"
        "- Strong eco weapon with rifle-killing potential.",
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
    "bodyDamage": "27 / 23",
    "legDamage": "22 / 21",
    "description":
        "High-rate-of-fire SMG designed for aggressive close-range fights.",
    "guide":
        "- Extremely dangerous at close range.\n"
        "- Primary Fire is fully automatic.\n"
        "- Alt-Fire provides a controlled four-round burst.\n"
        "- Avoid long-range fights against rifles.",
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
        "Versatile silenced SMG with high fire rate, manageable recoil, and good mobility.",
    "guide":
        "- Strong after winning a pistol round or during a light buy.\n"
        "- Excellent at close and medium ranges.\n"
        "- Use short bursts at longer distances.\n"
        "- Silenced fire makes your position harder to identify.",
  },

  // SHOTGUNS
  {
    "name": "BUCKY",
    "category": "SHOTGUNS",
    "icon": "assets/gun_icons/Bucky.webp",
    "cost": 850,
    "fireRate": "1.1 rds/s",
    "magazine": "5",
    "headDamage": "34 / 26 / 18",
    "bodyDamage": "17 / 13 / 9",
    "legDamage": "14 / 11 / 7",
    "description":
        "Pump-action shotgun with powerful close-range damage and an air-burst alternate fire.",
    "guide":
        "- 0-8m: 34 head / 17 body / 14 legs per pellet.\n"
        "- 8-12m: 26 head / 13 body / 11 legs per pellet.\n"
        "- 12-50m: 18 head / 9 body / 7 legs per pellet.\n"
        "- Primary Fire is strongest at close range.\n"
        "- Alt-Fire launches an air-burst canister for longer-range shots.\n"
        "- Moving and jumping while firing significantly reduces reliability.",
  },

  {
    "name": "JUDGE",
    "category": "SHOTGUNS",
    "icon": "assets/gun_icons/Judge.webp",
    "cost": 1850,
    "fireRate": "3.5 rds/s",
    "magazine": "5",
    "headDamage": "34 / 20 / 14",
    "bodyDamage": "17 / 10 / 7",
    "legDamage": "14 / 8 / 6",
    "description":
        "Fully automatic shotgun designed for dominating tight close-range spaces.",
    "guide":
        "- 0-10m: 34 head / 17 body / 14 legs per pellet.\n"
        "- 10-15m: 20 head / 10 body / 8 legs per pellet.\n"
        "- 15-50m: 14 head / 7 body / 6 legs per pellet.\n"
        "- Best used while holding tight angles.\n"
        "- Controller smokes can force enemies into its ideal range.\n"
        "- Avoid jumping or moving while firing.",
  },

  // RIFLES
  {
    "name": "BULLDOG",
    "category": "RIFLES",
    "icon": "assets/gun_icons/Bulldog.webp",
    "cost": 2050,
    "fireRate": "10.0 rds/s",
    "magazine": "24",
    "headDamage": "115",
    "bodyDamage": "35",
    "legDamage": "29",
    "description":
        "Affordable assault rifle with full-auto primary fire and three-round ADS bursts.",
    "guide":
        "- Excellent rifle for half-buy and anti-eco situations.\n"
        "- Primary Fire is fully automatic.\n"
        "- ADS switches to a controlled three-round burst.\n"
        "- A headshot followed by a body shot can eliminate a fully armored enemy.\n"
        "- Use ADS for long-range precision.",
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
    "legDamage": "49",
    "description":
        "Semi-automatic precision rifle built for accurate long-range engagements.",
    "guide":
        "- One-shot headshots kill fully armored enemies at any range.\n"
        "- High wall penetration makes it effective for wallbangs.\n"
        "- Use disciplined taps instead of panic spraying.\n"
        "- Its small magazine makes missed shots costly.",
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
    "legDamage": "33 / 30 / 26",
    "description":
        "Silenced full-auto rifle with high fire rate, excellent recoil control, and damage falloff.",
    "guide":
        "- 0-15m: 156 head / 39 body / 33 legs.\n"
        "- 15-30m: 140 head / 35 body / 30 legs.\n"
        "- 30-50m: 124 head / 31 body / 26 legs.\n"
        "- Excellent for close-to-medium range fights.\n"
        "- No visible bullet tracers make it strong through smokes.\n"
        "- Long-range headshots do not always kill Heavy Shield targets.",
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
        "Premier full-auto rifle with consistent damage and one-shot headshot potential at every range.",
    "guide":
        "- Deals 160 head damage at every range.\n"
        "- One-shot headshots kill Heavy Shield enemies.\n"
        "- Best used with controlled taps and short bursts.\n"
        "- Full sprays are more effective at close range.\n"
        "- Excellent for long sightlines.",
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
    "description":
        "Lightweight sniper rifle offering excellent mobility, accuracy, and value.",
    "guide":
        "- One-shot headshots kill enemies at any range.\n"
        "- Body shots kill enemies without shields.\n"
        "- Low 950-credit price makes it an excellent eco weapon.\n"
        "- Excellent mobility compared with heavier sniper rifles.\n"
        "- Strong for aggressive peeks and quick repositioning.",
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
    "legDamage": "119",
    "description":
        "Double-barrel sniper rifle capable of firing two rapid shots before reloading.",
    "guide":
        "- 140 body damage instantly kills enemies with Light Shields.\n"
        "- Two shots can be fired rapidly before a full reload.\n"
        "- The second shot requires more control due to increased recovery and spread.\n"
        "- Strong against Light Shield purchases.\n"
        "- Excellent mid-tier sniper for economical buys.",
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
        "Heavy bolt-action sniper capable of killing with a headshot or body shot at any range.",
    "guide":
        "- Headshots and body shots kill fully armored enemies at any range.\n"
        "- Leg shots deal 120 damage.\n"
        "- Hold long sightlines and reposition after getting a kill.\n"
        "- Use movement abilities or utility to escape aggressive situations.\n"
        "- One of the strongest weapons for denying long-range peeks.",
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
        "High-capacity light machine gun with strong wall penetration and increasing fire rate.",
    "guide":
        "- Fire rate increases as the weapon continues firing.\n"
        "- Excellent for suppressing enemies through walls and common spam locations.\n"
        "- Best used from defensive positions.\n"
        "- Sustained fire becomes more effective as the weapon spins up.",
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
        "Massive 100-round LMG built for sustained suppression and powerful wall penetration.",
    "guide":
        "- 0-30m: 95 head / 38 body / 32 legs.\n"
        "- 30-50m: 77 head / 31 body / 26 legs.\n"
        "- Fire rate ramps from 12 to 15.6 rounds per second while firing.\n"
        "- Excellent for wallbangs when combined with recon utility.\n"
        "- Huge magazine allows prolonged suppression.\n"
        "- Use crouch and ADS when committing to long sprays.",
  },
];
