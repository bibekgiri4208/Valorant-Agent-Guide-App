import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/agents/controllers_screen.dart';
import 'package:valorant_guide_app/screens/agents/duelists_screen.dart';
import 'package:valorant_guide_app/screens/agents/initiators_screen.dart';
import 'package:valorant_guide_app/screens/agents/sentinels_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Smooth, fast fade-slide navigation
  void _navigateToRoleScreen(BuildContext context, Widget targetScreen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (context, animation, secondaryAnimation) => targetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          );

          final slideTween = Tween<Offset>(
            begin: const Offset(0.0, 0.04),
            end: Offset.zero,
          ).animate(curve);

          return SlideTransition(
            position: slideTween,
            child: FadeTransition(opacity: curve, child: child),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C252E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C252E),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
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
              const Text(
                "Learn Your\nFaVorite agents",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              // 1. DUELISTS
              PressableCard(
                onTap: () =>
                    _navigateToRoleScreen(context, const DuelistsScreen()),
                child: _buildRoleCardContent(
                  title: 'Duelists',
                  logoPath: 'assets/logo/duelist_logo.png',
                  bgImagePath: 'assets/roles/jett_dark.webp',
                ),
              ),

              const SizedBox(height: 30),

              // 2. CONTROLLERS
              PressableCard(
                onTap: () =>
                    _navigateToRoleScreen(context, const ControllersScreen()),
                child: _buildRoleCardContent(
                  title: 'Controllers',
                  logoPath: 'assets/logo/controller_logo.png',
                  bgImagePath: 'assets/roles/omen_dark.webp',
                ),
              ),

              const SizedBox(height: 30),

              // 3. INITIATORS
              PressableCard(
                onTap: () =>
                    _navigateToRoleScreen(context, const InitiatorsScreen()),
                child: _buildRoleCardContent(
                  title: 'Initiators',
                  logoPath: 'assets/logo/initiator_logo.png',
                  bgImagePath: 'assets/roles/sova_dark.webp',
                ),
              ),

              const SizedBox(height: 30),

              // 4. SENTINELS
              PressableCard(
                onTap: () =>
                    _navigateToRoleScreen(context, const SentinelsScreen()),
                child: _buildRoleCardContent(
                  title: 'Sentinels',
                  logoPath: 'assets/logo/sentinel_logo.png',
                  bgImagePath: 'assets/roles/cypher_dark.webp',
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCardContent({
    required String title,
    required String logoPath,
    required String bgImagePath,
  }) {
    return Container(
      height: 150,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.white, width: 3),
        image: DecorationImage(
          image: AssetImage(bgImagePath),
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
            Image.asset(logoPath, width: 30, height: 30, color: Colors.white),
            const SizedBox(width: 8),
            Transform.translate(
              offset: const Offset(0, 3),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Valorant",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable Widget that provides a physical tap-down & bounce effect
class PressableCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const PressableCard({super.key, required this.child, required this.onTap});

  @override
  State<PressableCard> createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.decelerate,
        child: AnimatedOpacity(
          opacity: _isPressed ? 0.8 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }
}
