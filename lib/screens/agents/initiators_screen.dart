import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:valorant_guide_app/data/initiators_data.dart';
import 'package:valorant_guide_app/screens/agents/agents_detail_screen.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';

class InitiatorsScreen extends StatelessWidget {
  const InitiatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      backgroundColor: AppColors.scaffold(brightness),
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/icon/back_arrow.png',
            color: AppColors.backArrow(brightness),
            width: 24,
            height: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: AppColors.scaffold(brightness),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "INITIATORS",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 30,
            fontFamily: 'Valorant',
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
              const Text(
                "// PROTOCOL ROSTER",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 11,
                  color: AppColors.accent,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "CHOOSE YOUR\nINITIATOR",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 28,
                  color: AppColors.textPrimary(brightness),
                ),
              ),
              const Divider(thickness: 5, color: AppColors.accent),
              const SizedBox(height: 30),

              AnimationLimiter(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  itemCount: initiatorsData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 50,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final agent = initiatorsData[index];

                    // (0 -> 1 -> 2 -> 3)
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 150),
                      duration: const Duration(milliseconds: 400),
                      child: ScaleAnimation(
                        scale: 0.2,
                        child: FadeInAnimation(
                          child: Builder(
                            builder: (cardContext) {
                              return GestureDetector(
                                onTap: () {
                                  final RenderBox? renderBox =
                                      cardContext.findRenderObject()
                                          as RenderBox?;
                                  final cardPosition =
                                      renderBox?.localToGlobal(Offset.zero) ??
                                      Offset.zero;
                                  final cardSize = renderBox?.size ?? Size.zero;
                                  final screenSize = MediaQuery.sizeOf(
                                    cardContext,
                                  );

                                  final Alignment scaleAlignment = Alignment(
                                    ((cardPosition.dx + (cardSize.width / 2)) /
                                                screenSize.width) *
                                            2 -
                                        1,
                                    ((cardPosition.dy + (cardSize.height / 2)) /
                                                screenSize.height) *
                                            2 -
                                        1,
                                  );

                                  Navigator.push(
                                    cardContext,
                                    PageRouteBuilder(
                                      transitionDuration: const Duration(
                                        milliseconds: 400,
                                      ),
                                      reverseTransitionDuration: const Duration(
                                        milliseconds: 350,
                                      ),
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                          ) => AgentsDetailScreen(
                                            agentData: agent,
                                          ),
                                      transitionsBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child,
                                          ) {
                                            final curvedAnimation =
                                                CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.fastOutSlowIn,
                                                  reverseCurve:
                                                      Curves.easeInCubic,
                                                );

                                            return ScaleTransition(
                                              alignment: scaleAlignment,
                                              scale: Tween<double>(
                                                begin: 0.10,
                                                end: 1.0,
                                              ).animate(curvedAnimation),
                                              child: FadeTransition(
                                                opacity:
                                                    Tween<double>(
                                                      begin: 0.0,
                                                      end: 1.0,
                                                    ).animate(
                                                      CurvedAnimation(
                                                        parent: animation,
                                                        curve: const Interval(
                                                          0.0,
                                                          0.65,
                                                          curve: Curves.easeIn,
                                                        ),
                                                      ),
                                                    ),
                                                child: child,
                                              ),
                                            );
                                          },
                                    ),
                                  );
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // CARD BACKGROUND
                                    Positioned(
                                      top: 40,
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          border: Border.all(
                                            color: AppColors.rolePurple,
                                            width: 3,
                                          ),
                                          image: DecorationImage(
                                            image: const AssetImage(
                                              'assets/duelists/duelists_bg.webp',
                                            ),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.imageOverlay(brightness),
                                              BlendMode.darken,
                                            ),
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: AppColors.cardOverlay(brightness),
                                              ),
                                            ),
                                            Positioned(
                                              left: 10,
                                              top: 0,
                                              bottom: 0,
                                              child: Center(
                                                child: RotatedBox(
                                                  quarterTurns: 3,
                                                  child: Text(
                                                    agent["name"]
                                                        .toString()
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      color: AppColors.textPrimary(brightness),
                                                      fontSize: 16,
                                                      fontFamily: "Valorant",
                                                      fontWeight:
                                                          FontWeight.bold,
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

                                    // AGENT HERO IMAGE
                                    Positioned(
                                      top: -15,
                                      bottom: 0,
                                      right: -10,
                                      left: 30,
                                      child: Hero(
                                        tag: 'agent_image_${agent['name']}',
                                        child: Transform.scale(
                                          scale: 1.5,
                                          alignment: Alignment.bottomCenter,
                                          child: Image.asset(
                                            agent["image"],
                                            fit: BoxFit.contain,
                                            alignment: Alignment.bottomCenter,
                                            cacheHeight: 800,
                                            gaplessPlayback: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
    );
  }
}
