import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/agents/controllers_screen.dart';
import 'package:valorant_guide_app/screens/agents/duelists_screen.dart';
import 'package:valorant_guide_app/screens/agents/initiators_screen.dart';
import 'package:valorant_guide_app/screens/agents/sentinels_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C252E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C252E),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Valorant",
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
                "Learn Your\nFaVorite agents",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration: const Duration(
                        milliseconds: 500,
                      ),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const DuelistsScreen();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOutCubic,
                            );

                            return FadeTransition(
                              opacity: curvedAnimation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.5),
                                  end: Offset.zero,
                                ).animate(curvedAnimation),
                                child: ScaleTransition(
                                  scale: Tween<double>(
                                    begin: 0.4,
                                    end: 1.0,
                                  ).animate(curvedAnimation),
                                  child: child,
                                ),
                              ),
                            );
                          },
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.white, width: 0.5),
                    image: DecorationImage(
                      image: AssetImage('assets/roles/jett_dark.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.5),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/duelist_logo.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Transform.translate(
                          offset: const Offset(0, 3),
                          child: const Text(
                            'Duelists',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Valorant",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration: const Duration(
                        milliseconds: 500,
                      ),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const ControllersScreen();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOutCubic,
                            );

                            return FadeTransition(
                              opacity: curvedAnimation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.5),
                                  end: Offset.zero,
                                ).animate(curvedAnimation),
                                child: ScaleTransition(
                                  scale: Tween<double>(
                                    begin: 0.4,
                                    end: 1.0,
                                  ).animate(curvedAnimation),
                                  child: child,
                                ),
                              ),
                            );
                          },
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.white, width: 0.5),
                    image: DecorationImage(
                      image: AssetImage('assets/roles/omen_dark.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.5),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/controller_logo.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Transform.translate(
                          offset: const Offset(0, 3),
                          child: Text(
                            'Controllers',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Valorant",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration: const Duration(
                        milliseconds: 500,
                      ),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const InitiatorsScreen();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOutCubic,
                            );

                            return FadeTransition(
                              opacity: curvedAnimation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.5),
                                  end: Offset.zero,
                                ).animate(curvedAnimation),
                                child: ScaleTransition(
                                  scale: Tween<double>(
                                    begin: 0.4,
                                    end: 1.0,
                                  ).animate(curvedAnimation),
                                  child: child,
                                ),
                              ),
                            );
                          },
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.white, width: 0.5),
                    image: DecorationImage(
                      image: AssetImage('assets/roles/gekko_dark.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.5),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/initiator_logo.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Transform.translate(
                          offset: const Offset(0, 3),
                          child: Text(
                            'Initiators',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Valorant",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration: const Duration(
                        milliseconds: 500,
                      ),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const SentinelsScreen();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOutCubic,
                            );

                            return FadeTransition(
                              opacity: curvedAnimation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.5),
                                  end: Offset.zero,
                                ).animate(curvedAnimation),
                                child: ScaleTransition(
                                  scale: Tween<double>(
                                    begin: 0.4,
                                    end: 1.0,
                                  ).animate(curvedAnimation),
                                  child: child,
                                ),
                              ),
                            );
                          },
                    ),
                  );
                },
                child: Container(
                  height: 150,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.white, width: 0.5),
                    image: DecorationImage(
                      image: AssetImage('assets/roles/killjoy_dark.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.5),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/sentinel_logo.png',
                          width: 30,
                          height: 30,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Transform.translate(
                          offset: const Offset(0, 3),
                          child: Text(
                            'Sentinels',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: "Valorant",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
