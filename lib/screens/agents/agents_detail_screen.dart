import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/agent_data.dart';

class AgentsDetailScreen extends StatefulWidget {
  const AgentsDetailScreen({super.key});

  @override
  State<AgentsDetailScreen> createState() => _AgentsDetailScreenState();
}

class _AgentsDetailScreenState extends State<AgentsDetailScreen> {
  late final PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onAbilitySelected(int index) {
    // Update state immediately for the tapped icon
    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xFF1C252E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.55,
                  color: const Color(0xFFFF4654),
                  child: Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 280,
                        child: Image.asset(
                          "assets/controllers/Omen.webp",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: const Color(0xFF1C252E),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 400,
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        SizedBox(height: 20),
                                        Text(
                                          "Agent Description",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: "Valorant",
                                            color: Colors.white,
                                          ),
                                        ),
                                        Divider(thickness: 2),
                                        Text(
                                          "Role: Controller",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Valorant",
                                          ),
                                        ),
                                        Divider(thickness: 2),
                                        Text(
                                          "Country: Unknown",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Valorant",
                                          ),
                                        ),
                                        Divider(thickness: 2),
                                        Text(
                                          "Agent No. 3",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Valorant",
                                          ),
                                        ),
                                        Divider(thickness: 2),
                                        Text(
                                          "A phantom of a memory, Omen hunts in the shadows. He renders enemies blind, teleports across the field, then lets paranoia take hold as his foe scrambles to learn where he might strike next.",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Divider(),
                                        Text(
                                          "Prior to joining the VALORANT Protocol, Omen was a highly skilled and ruthless assassin...",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 50),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Omen",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Valorant",
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Controller",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: "Valorant",
                          letterSpacing: 2,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "SPECIAL ABILITIES",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Valorant",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Ability Selectors
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        abilityIcons.length,
                        (index) => GestureDetector(
                          onTap: () => _onAbilitySelected(index),
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? const Color(0xFFFF4654)
                                  : Colors.transparent,
                              border: Border.all(color: Colors.white38),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                abilityIcons[index],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Horizontal Scrollable Ability Details Section
              SizedBox(
                height: 520,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    // Only update index if user manually drags/swipes the PageView
                    if (_selectedIndex != index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }
                  },
                  children: [
                    // Ability 0: Shrouded Step
                    _buildAbilityPage(
                      title: "Shrouded Step",
                      description:
                          "EQUIP a shadow walk ability and see its range indicator. FIRE to begin a brief channel, then teleport to the marked location.",
                    ),

                    // Ability 1: Paranoia
                    _buildAbilityPage(
                      title: "Paranoia",
                      images: [
                        "assets/abilities/omen/paranoia_cast.webp",
                        "assets/abilities/omen/paranoia_nearsight.webp",
                      ],
                      description:
                          "Equip a shadow projectile and fire to briefly reduce the vision range of all players it touches. This ability can pass through walls, making it excellent for initiating fights.",
                    ),

                    // Ability 2: Dark Cover
                    _buildAbilityPage(
                      title: "Dark Cover",
                      description:
                          "EQUIP a shadow orb and enter a phased world to place and target the orbs. PRESS the ability key to throw the shadow orb to the marked location.",
                    ),

                    // Ability 3: From the Shadows
                    _buildAbilityPage(
                      title: "From the Shadows",
                      description:
                          "EQUIP a tactical map. FIRE to begin teleporting to the selected location. While teleporting, Omen will appear as a Shade that can be destroyed by an enemy to cancel.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAbilityPage({
    required String title,
    required String description,
    List<String>? images,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Valorant",
              ),
            ),
            const SizedBox(height: 15),
            if (images != null)
              ...images.map(
                (imgPath) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imgPath,
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
