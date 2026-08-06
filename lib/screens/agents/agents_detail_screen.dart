import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/agent_data.dart';

class AgentsDetailScreen extends StatelessWidget {
  const AgentsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF1C252E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.60,
                  color: Color(0xFFFF4654),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.person_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Spacer(),
                      SizedBox(
                        height: 280,
                        child: Image.asset(
                          "assets/controllers/Omen.webp",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Omen",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Valorant",
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Controller",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: "Valorant",
                          letterSpacing: 2,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SPECIAL ABILITIES",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        abilityIcons.length,
                        (index) => Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: index == 0
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

                    SizedBox(height: 30),

                    Text(
                      "Paranoia",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Valorant",
                      ),
                    ),

                    SizedBox(height: 15),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/abilities/omen/paranoia_cast.webp",
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 20),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/abilities/omen/paranoia_nearsight.webp",
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Equip a shadow projectile and fire to briefly reduce the vision range of all players it touches. This ability can pass through walls, making it excellent for initiating fights.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
