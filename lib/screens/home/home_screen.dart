import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/agents/controllers_screen.dart';
import 'package:valorant_guide_app/screens/agents/duelists_screen.dart';
import 'package:valorant_guide_app/screens/agents/initiators_screen.dart';
import 'package:valorant_guide_app/screens/agents/sentinels_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToRoleScreen(BuildContext context, Widget targetScreen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => targetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOutCubic,
            reverseCurve: Curves.easeInOutCubic,
          );

          final slideTween = Tween<Offset>(
            begin: const Offset(0.0, 0.9),
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
          "Valo Guide",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 18,
                    color: const Color(0xFFFF4654),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "// SELECT PROTOCOL ROLE",
                    style: TextStyle(
                      fontFamily: 'Valorant',
                      fontSize: 12,
                      color: Color(0xFFFF4654),
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "LEARN YOUR\nFAVORITE AGENTS",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 32,
                  color: Colors.white,
                  height: 1.15,
                  letterSpacing: 1.0,
                ),
              ),

              const SizedBox(height: 24),

              // DUELISTS
              PressableCard(
                borderColor: Colors.grey,
                borderWidth: 3,
                borderRadius: 12,
                onTap: () =>
                    _navigateToRoleScreen(context, const DuelistsScreen()),
                child: _buildRoleCardContent(
                  roleNumber: '01',
                  title: 'DUELISTS',
                  tagline: 'ENTRY & FRAGGING',
                  logoPath: 'assets/logo/duelist_logo.png',
                  bgImagePath: 'assets/roles/jett_bg.webp',
                ),
              ),

              const SizedBox(height: 16),

              // CONTROLLERS
              PressableCard(
                borderColor: Colors.grey,
                borderWidth: 3,
                borderRadius: 12,
                onTap: () =>
                    _navigateToRoleScreen(context, const ControllersScreen()),
                child: _buildRoleCardContent(
                  roleNumber: '02',
                  title: 'CONTROLLERS',
                  tagline: 'SMOKES & VISION',
                  logoPath: 'assets/logo/controller_logo.png',
                  bgImagePath: 'assets/roles/viper_cinematic.webp',
                ),
              ),

              const SizedBox(height: 16),

              // INITIATORS
              PressableCard(
                borderColor: Colors.grey,
                borderWidth: 3,
                borderRadius: 12,
                onTap: () =>
                    _navigateToRoleScreen(context, const InitiatorsScreen()),
                child: _buildRoleCardContent(
                  roleNumber: '03',
                  title: 'INITIATORS',
                  tagline: 'RECON & DISRUPTION',
                  logoPath: 'assets/logo/initiator_logo.png',
                  bgImagePath: 'assets/roles/sova_cinematic.webp',
                ),
              ),

              const SizedBox(height: 16),

              // SENTINELS
              PressableCard(
                borderColor: Colors.grey,
                borderWidth: 3,
                borderRadius: 12,
                onTap: () =>
                    _navigateToRoleScreen(context, const SentinelsScreen()),
                child: _buildRoleCardContent(
                  roleNumber: '04',
                  title: 'SENTINELS',
                  tagline: 'DEFENSE & ANCHORING',
                  logoPath: 'assets/logo/sentinel_logo.png',
                  bgImagePath: 'assets/roles/cypher_cinematic.webp',
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCardContent({
    required String roleNumber,
    required String title,
    required String tagline,
    required String logoPath,
    required String bgImagePath,
  }) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                bgImagePath,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),

            // Dark Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xFF12181F).withValues(alpha: 0.7),
                      const Color(0xFF12181F).withValues(alpha: 0.1),
                      Colors.black.withValues(alpha: 0.05),
                    ],
                  ),
                ),
              ),
            ),

            // Content Layer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  // Icon Box
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF4654),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFFF4654).withValues(alpha: 0.4),
                      ),
                    ),
                    child: Image.asset(
                      logoPath,
                      width: 30,
                      height: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$roleNumber // $tagline",
                          style: const TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 10,
                            color: Color(0xFFFF4654),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "Valorant",
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tap-down & bounce effect widget supporting custom border color, width, and radius
class PressableCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;

  const PressableCard({
    super.key,
    required this.child,
    required this.onTap,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius = 12.0,
  });

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
        scale: _isPressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 90),
        curve: Curves.decelerate,
        child: AnimatedOpacity(
          opacity: _isPressed ? 0.85 : 1.0,
          duration: const Duration(milliseconds: 90),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: widget.borderColor != null
                  ? Border.all(
                      color: widget.borderColor!,
                      width: widget.borderWidth,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
