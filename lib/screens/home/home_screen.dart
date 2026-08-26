import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/agents/controllers_screen.dart';
import 'package:valorant_guide_app/screens/agents/duelists_screen.dart';
import 'package:valorant_guide_app/screens/agents/initiators_screen.dart';
import 'package:valorant_guide_app/screens/agents/sentinels_screen.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  final double bottomOverlayHeight;
  const HomeScreen({super.key, this.bottomOverlayHeight = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _staggerController;
  late final Animation<double> _headerFade;
  late final Animation<Offset> _headerSlide;
  late final List<Animation<double>> _cardFades;
  late final List<Animation<Offset>> _cardSlides;

  void _navigateToRoleScreen(BuildContext context, Widget targetScreen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        reverseTransitionDuration: const Duration(milliseconds: 400),
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
  void initState() {
    super.initState();
    _staggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _headerFade = CurvedAnimation(
      parent: _staggerController,
      curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
    );
    _headerSlide = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _staggerController,
            curve: const Interval(0.0, 0.35, curve: Curves.easeOutCubic),
          ),
        );

    _cardFades = List.generate(4, (i) {
      final start = 0.2 + i * 0.15;
      return CurvedAnimation(
        parent: _staggerController,
        curve: Interval(start, start + 0.35, curve: Curves.easeOut),
      );
    });

    _cardSlides = List.generate(4, (i) {
      final start = 0.2 + i * 0.15;
      return Tween<Offset>(
        begin: const Offset(0, 0.25),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _staggerController,
          curve: Interval(start, start + 0.35, curve: Curves.easeOutCubic),
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _staggerController.forward();
    });
  }

  @override
  void dispose() {
    _staggerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Valo Guide",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 2.0,
            shadows: const [
              Shadow(
                color: Colors.black54,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        padding: EdgeInsets.fromLTRB(
          20,
          15,
          20,
          widget.bottomOverlayHeight + 15,
        ),
        children: [
          FadeTransition(
            opacity: _headerFade,
            child: SlideTransition(
              position: _headerSlide,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: 4, height: 18, color: AppColors.accent),
                      const SizedBox(width: 8),
                      Text(
                        "// SELECT PROTOCOL ROLE",
                        style: TextStyle(
                          fontFamily: 'Valorant',
                          fontSize: 12,
                          color: AppColors.accent,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "LEARN YOUR\nFAvORITE AGENTS",
                    style: TextStyle(
                      fontFamily: 'Valorant',
                      fontSize: 32,
                      color: AppColors.textPrimary(brightness),
                      height: 1.15,
                      letterSpacing: 1.0,
                      shadows: const [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          FadeTransition(
            opacity: _cardFades[0],
            child: SlideTransition(
              position: _cardSlides[0],
              child: PressableCard(
                borderColor: AppColors.divider(brightness),
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
            ),
          ),

          const SizedBox(height: 16),

          FadeTransition(
            opacity: _cardFades[1],
            child: SlideTransition(
              position: _cardSlides[1],
              child: PressableCard(
                borderColor: AppColors.divider(brightness),
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
            ),
          ),

          const SizedBox(height: 16),

          FadeTransition(
            opacity: _cardFades[2],
            child: SlideTransition(
              position: _cardSlides[2],
              child: PressableCard(
                borderColor: AppColors.divider(brightness),
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
            ),
          ),

          const SizedBox(height: 16),

          FadeTransition(
            opacity: _cardFades[3],
            child: SlideTransition(
              position: _cardSlides[3],
              child: PressableCard(
                borderColor: AppColors.divider(brightness),
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
            ),
          ),

          const SizedBox(height: 25),
        ],
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
            Positioned.fill(
              child: Image.asset(
                bgImagePath,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.accent.withValues(alpha: 0.4),
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
                        Stack(
                          children: [
                            Text(
                              "$roleNumber // $tagline",
                              style: TextStyle(
                                fontFamily: 'Valorant',
                                fontSize: 10,
                                letterSpacing: 1.2,
                                shadows: const [
                                  Shadow(
                                    color: Colors.black54,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1.5
                                  ..color = Colors.white,
                              ),
                            ),
                            Text(
                              "$roleNumber // $tagline",
                              style: TextStyle(
                                fontFamily: 'Valorant',
                                fontSize: 10,
                                color: AppColors.accent,
                                letterSpacing: 1.2,
                                shadows: const [
                                  Shadow(
                                    color: Colors.black54,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "Valorant",
                            letterSpacing: 1.2,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
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

/// Tap-down & bounce effect widget
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
