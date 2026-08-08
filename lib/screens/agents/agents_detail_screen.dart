import 'package:flutter/material.dart';

class AgentsDetailScreen extends StatefulWidget {
  final Map<String, dynamic> agentData;

  const AgentsDetailScreen({super.key, required this.agentData});

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

    // Smoothly synchronizes icon highlights with page scrolling
    _pageController.addListener(() {
      if (_pageController.hasClients && _pageController.page != null) {
        final currentRoundIndex = _pageController.page!.round();
        if (currentRoundIndex != _selectedIndex) {
          setState(() {
            _selectedIndex = currentRoundIndex;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onAbilitySelected(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final agent = widget.agentData;
    final List abilities = agent['abilities'] ?? [];

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
                          agent['image'] ?? '',
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
                                      children: [
                                        const SizedBox(height: 20),
                                        const Text(
                                          "Agent Description",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: "Valorant",
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Divider(thickness: 2),
                                        Text(
                                          "Role: ${agent['role'] ?? ''}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Valorant",
                                          ),
                                        ),
                                        const Divider(thickness: 2),
                                        Text(
                                          "Country: ${agent['country'] ?? 'Unknown'}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Valorant",
                                          ),
                                        ),
                                        const Divider(thickness: 2),
                                        Text(
                                          "Agent No. ${agent['agentNumber'] ?? ''}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Valorant",
                                          ),
                                        ),
                                        const Divider(thickness: 2),
                                        Text(
                                          agent['summary'] ?? '',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const Divider(),
                                        Text(
                                          agent['lore'] ?? '',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          agent['name'] ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Valorant",
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        agent['role'] ?? '',
                        style: const TextStyle(
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
                        abilities.length,
                        (index) => GestureDetector(
                          onTap: () => _onAbilitySelected(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
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
                                abilities[index]['icon'],
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

              // Horizontal Scrollable Ability Pages
              SizedBox(
                height: 520,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: abilities.length,
                  itemBuilder: (context, index) {
                    final ability = abilities[index];
                    return _buildAbilityPage(
                      title: ability['name'] ?? '',
                      description: ability['description'] ?? '',
                      images: (ability['images'] as List?)?.cast<String>(),
                    );
                  },
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
            if (images != null && images.isNotEmpty)
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
