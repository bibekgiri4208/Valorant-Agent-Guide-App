import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/agent_data.dart';

class AgentsDetailScreen extends StatelessWidget {
  const AgentsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

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
                  height: screenHeight * 0.61,
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
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Color(0xFF1C252E),
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
                                          "Prior to joining the VALORANT Protocol, Omen was a highly skilled and ruthless assassin for the organization known as Scions of Hourglass.In order to stop the discovery of Radianite from becoming public knowledge, he was sent to assassinate the chief scientist in charge of the research on radianite, Dr. Sabine Callas (Viper) at her lab. In the altercation that happens between the two, Omen is severely burned by the contents of a vial Dr.Callas had been examining, and stumbles inside a test chamber. To prevent him from attacking again, Viper activates a mechanism in the test chamber that causes Omen to be hit by multiple beams of pure radianite energy; This incident causes Omen to be ripped apart across space time and lose majority of his memories. The details of how he is brought back to life and kept in a stable state is still unclear but it is highly implied through voicelines that Sage has had a role to play in achieving that.",
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
                        child: Text(
                          "Omen",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Valorant",
                          ),
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
                        fontFamily: "Valorant",
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
