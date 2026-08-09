import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/duelists_data.dart';
import 'package:valorant_guide_app/screens/agents/agents_detail_screen.dart';

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
        title: const Text(
          "DUELISTS",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 28,
            fontFamily: 'Valorant',
          ),
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CHOOSE YOUR\nDUELIST",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Divider(thickness: 2),
              SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                itemCount: duelistsData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 50,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final agent = duelistsData[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  AgentsDetailScreen(agentData: agent),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                // 1. Slide upward from slightly below (10% lower)
                                const beginOffset = Offset(0.1, 0.0);
                                const endOffset = Offset.zero;
                                const curve = Curves.easeOutCubic;

                                final slideTween = Tween(
                                  begin: beginOffset,
                                  end: endOffset,
                                ).chain(CurveTween(curve: curve));

                                // 2. Combine Fade and Slide
                                return SlideTransition(
                                  position: animation.drive(slideTween),
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                                );
                              },
                          transitionDuration: const Duration(milliseconds: 350),
                        ),
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // 1. CARD BACKGROUND
                        Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white30,
                                width: 4,
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/duelists/duelists_bg.png',
                                ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withValues(alpha: 0.5),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                // Dark Overlay
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.black.withValues(alpha: 0.25),
                                  ),
                                ),

                                // Vertical Name
                                Positioned(
                                  left: 10,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        agent["name"].toString().toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: "Valorant",
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // 2. AGENT IMAGE
                        Positioned(
                          top: -15,
                          bottom: 0,
                          right: -10,
                          left: 30,
                          child: Transform.scale(
                            scale: 1.5,
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              agent["image"],
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
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
