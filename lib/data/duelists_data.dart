final List<Map<String, dynamic>> duelistsData = [
  //Jett
  {
    "name": "Jett",
    "role": "Duelist",
    "image": "assets/duelists/Jett.webp",
    "roleIcon": "assets/logo/duelist_logo.png",
    "country": "Unknown",
    "agentNumber": "10",
    "summary":
        "Representing her home country of South Korea, Jett's agile and evasive fighting style lets her take risks no one else can. She runs circles around every skirmish, cutting enemies before they even know what hit them.",
    "abilities": [
      {
        "name": "CloudBurst",
        "icon": "assets/abilities/jett/cloudburst.webp",
        "description":
            "INSTANTLY throw a projectile that expands into a brief vision-blocking cloud on impact with a surface. HOLD the ability key to curve the smoke in the direction of your crosshair.",
        "video": "assets/abilities/jett/cloudburst.mp4",
      },
      {
        "name": "Updraft",
        "icon": "assets/abilities/jett/updraft.webp",
        "description": "INSTANTLY propel Jett high into the air.",
        "video": "assets/abilities/jett/updraft.mp4",
      },
      {
        "name": "Tailwind",
        "icon": "assets/abilities/jett/tailwind.webp",
        "description":
            "ACTIVATE to prepare a gust of wind for a limited time. RE-USE the wind to propel Jett in the direction she is moving. If Jett is standing still, she propels forward. Tailwind charge resets every two kills.",
        "video": "assets/abilities/jett/tailwind.mp4",
      },
      {
        "name": "Blade Storm",
        "icon": "assets/abilities/jett/blade_storm.webp",
        "description":
            "EQUIP a set of highly accurate throwing knives. FIRE to throw a single knife and recharge knives on a kill. ALT FIRE to throw all remaining daggers but does not recharge on a kill.",
        "video": "assets/abilities/jett/blade_storm.mp4",
      },
    ],
  },

  //Phoenix
  {
    "name": "Phoenix",
    "role": "Duelist",
    "image": "assets/duelists/Phoenix.webp",
    "roleIcon": "assets/logo/duelist_logo.png",
    "country": "United Kingdom",
    "agentNumber": "09",
    "summary":
        "A bright star from the U.K., Phoenix's star power shines through in his fighting style, igniting the battlefield with flash and flare. He fights with fire in his heart and fire at his foes.",
    "abilities": [
      {
        "name": "Blaze",
        "icon": "assets/abilities/phoenix/blaze.webp",
        "description":
            "EQUIP a flame wall. FIRE to create a line of flame that moves forward, creating a wall of fire that blocks vision and damages players passing through it. HOLD FIRE to bend the wall in the direction of your crosshair.",
        "video": "assets/abilities/phoenix/blaze.mp4",
      },
      {
        "name": "Curveball",
        "icon": "assets/abilities/phoenix/curveball.webp",
        "description":
            "EQUIP a flare orb that takes a curving path and detonates shortly after throwing. FIRE to curve the flare orb to the left, detonating and blinding any player who sees the orb. ALTERNATE FIRE to curve the flare orb to the right.",
        "video": "assets/abilities/phoenix/curveball.mp4",
      },
      {
        "name": "Hot Hands",
        "icon": "assets/abilities/phoenix/hot_hands.webp",
        "description":
            "EQUIP a fireball. FIRE to throw it, creating a lingering fire zone that damages enemies but heals Phoenix.",
        "video": "assets/abilities/phoenix/hot_hands.mp4",
      },
      {
        "name": "Run It Back",
        "icon": "assets/abilities/phoenix/run_it_back.webp",
        "description":
            'INSTANTLY place a marker at Phoenix\'s location. While this ability is active, dying or allowing the timer to expire will end this ability and bring Phoenix back to this location with full health.',
        "video": "assets/abilities/phoenix/run_it_back.mp4",
      },
    ],
  },

  //Reyna
  {
    "name": "Reyna",
    "role": "Duelist",
    "image": "assets/duelists/Reyna.webp",
    "roleIcon": "assets/logo/duelist_logo.png",
    "country": "Mexico",
    "agentNumber": "11",
    "summary":
        "Hailing from Mexico, Reyna thrives on the battlefield. She devours the souls of her enemies, using their life force to fuel her own. Her abilities allow her to dominate in one-on-one fights, making her a formidable opponent.",
    "abilities": [
      {
        "name": "Leer",
        "icon": "assets/abilities/reyna/leer.webp",
        "description":
            "EQUIP an ethereal, destructible eye. FIRE to cast the eye forward, briefly Nearsighting all enemies who look at it.",
        "video": "assets/abilities/reyna/leer.mp4",
      },
      {
        "name": "Devour",
        "icon": "assets/abilities/reyna/devour.webp",
        "description":
            'INSTANTLY consume a Soul Orb from a killed enemy, healing Reyna for a short duration. If Reyna is at full health, Devour will grant her temporary overheal.',
        "video": "assets/abilities/reyna/devour.mp4",
      },
      {
        "name": "Dismiss",
        "icon": "assets/abilities/reyna/dismiss.webp",
        "description":
            'INSTANTLY consume a Soul Orb from a killed enemy, becoming intangible for a short duration.',
        "video": "assets/abilities/reyna/dismiss.mp4",
      },
      {
        "name": "Empress",
        "icon": "assets/abilities/reyna/empress.webp",
        "description":
            'ACTIVATE to enter a frenzy, increasing firing speed, equip and reload speed dramatically. While Empress is active, kills extend the duration of the ability. Also if Impress is active, Reyna can use her Devour and Dismiss abilities as long as there is Soul Orb.',
        "video": "assets/abilities/reyna/empress.mp4",
      },
    ],
  },

  //Yoru
  {
    "name": "Yoru",
    "role": "Duelist",
    "image": "assets/duelists/Yoru.webp",
    "roleIcon": "assets/logo/duelist_logo.png",
    "country": "Japan",
    "agentNumber": "15",
    "summary":
        "Hailing from Japan, Yoru uses deception and stealth to infiltrate enemy lines. He can manipulate space and time to create confusion and gain the upper hand in combat.",
    "abilities": [
      {
        "name": "Fakeout",
        "icon": "assets/abilities/yoru/fake_out.webp",
        "description":
            'EQUIP an echo that transforms into a mirror image of Yoru when activated FIRE to instantly activate the mirror image and send it forward ALT FIRE to place an inactive echo USE to transform an inactive echo into a mirror image and send it forward. Mirror images explode in a blinding flash when destroyed by enemies.',
        "video": "assets/abilities/yoru/fake_out.mp4",
      },
      {
        "name": "Blindside",
        "icon": "assets/abilities/yoru/blindside.webp",
        "description":
            'EQUIP an unstable dimensional fragment that can be bounced off walls. FIRE to throw, which will detonate after a brief delay, blinding all players in its line of sight.',
        "video": "assets/abilities/yoru/blindside.mp4",
      },
      {
        "name": "Gatecrash",
        "icon": "assets/abilities/yoru/gate_crash.webp",
        "description":
            'EQUIP a rift tether FIRE to send the tether forward. ALT FIRE to place a stationary tether. ACTIVATE to teleport to the tether\'s location. USE to trigger a fake teleport.',
        "video": "assets/abilities/yoru/gate_crash.mp4",
      },
      {
        "name": "Dimensional Drift",
        "icon": "assets/abilities/yoru/dimensional_drift.webp",
        "description":
            'EQUIP a mask that can see between dimensions. FIRE to drift into Yoru\'s dimension, unable to be affected or seen by enemies from the outside. REACTIVATE to exit Yoru\'s dimension early.',
        "video": "assets/abilities/yoru/dimensional_drift.mp4",
      },
    ],
  },

  //Iso
  {
    "name": "Iso",
    "role": "Duelist",
    "image": "assets/duelists/Iso.webp",
    "roleIcon": "assets/logo/duelist_logo.png",
    "country": "Unknown",
    "agentNumber": "24",
    "summary":
        "Chinese fixer for hire, Iso falls into a flow state to dismantle the opposition. Reconfiguring ambient energy into bulletproof protection, he advances with focus towards his next duel to the death.",
    "abilities": [
      {
        "name": "Contingency",
        "icon": "assets/abilities/iso/contingency.webp",
        "description":
            'EQUIP to assemble prismatic energy. FIRE to push an indestructible wall of energy forward that blocks bullets.',
        "video": "assets/abilities/iso/contingency.mp4",
      },
      {
        "name": "Undercut",
        "icon": "assets/abilities/iso/undercut.webp",
        "description":
            'EQUIP a molecular bolt. Fire to throw it forward, applying a brief FRAGILE to all players it touches. The bolt can pass through solid objects, including walls.',
        "video": "assets/abilities/iso/undercut.mp4",
      },
      {
        "name": "Double Tap",
        "icon": "assets/abilities/iso/double_tap.webp",
        "description":
            'START a focus timer. Once completed, enter a flow state during which downed enemies you kill or damage generate an energy orb. Shooting this orb grants you a shield which absorbs one instance of damage from any source.',
        "video": "assets/abilities/iso/double_tap.mp4",
      },
      {
        "name": "Kill Contract",
        "icon": "assets/abilities/iso/kill_contract.webp",
        "description":
            'EQUIP an interdimensional arena. FIRE to hurl a column of energy through the battlefield, pulling you and the first enemy hit into the arena. You and your opponent duel to the death.',
        "video": "assets/abilities/iso/kill_contract.mp4",
      },
    ],
  },

  //Neon
  {
    "name": "Neon",
    "role": "Duelist",
    "image": "assets/duelists/Neon.webp",
    "roleIcon": "assets/logo/duelist_logo.png",
    "country": "Philippines",
    "agentNumber": "19",
    "summary":
        "Filipino Agent Neon surges forward at shocking speeds, discharging bursts of bioelectric radiance as fast as her body generates it. She races ahead to catch enemies off guard, then strikes them down quicker than lightning.",
    "abilities": [
      {
        "name": "Fast Lane",
        "icon": "assets/abilities/neon/fast_lane.webp",
        "description":
            'FIRE two energy lines forward on the ground that extend a short distance or until they hit a surface. The lines rise into walls of static electricity that block vision and damage enemies passing through them.',
        "video": "assets/abilities/neon/fast_lane.mp4",
      },
      {
        "name": "Relay Bolt",
        "icon": "assets/abilities/neon/relay_bolt.webp",
        "description":
            'INSTANTLY throw an energy bolt that bounces once. Upon hitting each surface, the bolt electrifies the ground below with a concussive blast.',
        "video": "assets/abilities/neon/relay_bolt.mp4",
      },
      {
        "name": "High Gear",
        "icon": "assets/abilities/neon/high_gear.webp",
        "description":
            'INSTANTLY channel Neon\'s power for increased speed. When charged, ALT FIRE to trigger an electric slide. Slide charge resets every two kills.',
        "video": "assets/abilities/neon/high_gear.mp4",
      },
      {
        "name": "Overdrive",
        "icon": "assets/abilities/neon/overdrive.webp",
        "description":
            'Unleash Neon\'s full power and speed for a short duration. FIRE to channel the power into a deadly lightning beam with high movement accuracy. The duration resets on each kill.',
        "video": "assets/abilities/neon/overdrive.mp4",
      },
    ],
  },
];
