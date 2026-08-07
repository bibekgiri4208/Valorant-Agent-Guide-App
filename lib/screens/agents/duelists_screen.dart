import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/agent_data.dart';

class DuelistsScreen extends StatelessWidget {
  const DuelistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C252E),
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/icon/back_arrow.png',
            color: Colors.white,
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFF1C252E),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Duelists",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 30,
            fontFamily: 'Valorant',
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Your\nDuelist",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 30),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: duelistsData.length,
                itemBuilder: (context, index) {
                  final agent = duelistsData[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white, width: 0.5),
                        image: DecorationImage(
                          image: const AssetImage(
                            'assets/duelists/duelists_bg.png',
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withValues(alpha: 0.4),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            // Agent Image
                            Positioned.fill(
                              child: Image.asset(
                                agent["image"],
                                fit: BoxFit.cover,
                                alignment: const Alignment(0.0, -0.7),
                                cacheWidth: 800,
                                cacheHeight: 800,
                              ),
                            ),

                            // Dark Overlay
                            Container(
                              color: Colors.black.withValues(alpha: 0.3),
                            ),

                            // Agent Name
                            Center(
                              child: Text(
                                agent["name"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "Valorant",
                                ),
                              ),
                            ),

                            Positioned(
                              top: 12,
                              left: 12,
                              child: Image.asset(
                                agent["roleIcon"],
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
