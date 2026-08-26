import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/home/arsenal_screen.dart';
import 'package:valorant_guide_app/screens/home/guides_screen.dart';
import 'package:valorant_guide_app/screens/home/home_screen.dart';
import 'package:valorant_guide_app/screens/home/roles_screen.dart';
import 'package:valorant_guide_app/screens/home/settings_screen.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';

class DashBoardScreen extends StatefulWidget {
  final bool playEntryAnimation;
  const DashBoardScreen({super.key, this.playEntryAnimation = false});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  late final PageController _pageController;
  late final AnimationController _entryController;
  late final Animation<double> _entryFade;
  late final Animation<Offset> _homeSlide;
  late final Animation<double> _navFade;
  late final Animation<Offset> _navSlide;
  Key _homeKey = UniqueKey();

  static const double _navBarHeight = 68;
  static const double _navBarBottomMargin = 14;
  static const double _navBarSideMargin = 20;

  final List<Map<String, dynamic>> _navItems = const [
    {"label": "Home", "icon": "assets/logo/valorant_logo.png"},
    {"label": "Roles", "icon": "assets/icon/roles.png"},
    {"label": "Guide", "icon": "assets/icon/guide.png"},
    {"label": "Arsenal", "icon": "assets/logo/rifles.png"},
    {"label": "Developer", "icon": "assets/icon/about_us.png"},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _entryFade = CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    );

    _homeSlide = Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _entryController,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
          ),
        );

    _navFade = CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0.4, 0.9, curve: Curves.easeOut),
    );

    _navSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _entryController,
            curve: const Interval(0.4, 0.9, curve: Curves.easeOutCubic),
          ),
        );

    if (widget.playEntryAnimation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _entryController.forward();
      });
    } else {
      _entryController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _entryController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      if (index == 0) {
        _homeKey = UniqueKey();
      }
      setState(() => _currentIndex = index);
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final floatingBarTotalHeight =
        _navBarHeight + _navBarBottomMargin + bottomPadding;
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: AppColors.scaffold(brightness),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SlideTransition(
            position: _homeSlide,
            child: FadeTransition(
              opacity: _entryFade,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  HomeScreen(
                    key: _homeKey,
                    bottomOverlayHeight: floatingBarTotalHeight,
                  ),
                  RolesScreen(
                    bottomOverlayHeight: floatingBarTotalHeight,
                  ),
                  GuidesScreen(bottomOverlayHeight: floatingBarTotalHeight),
                  ArsenalScreen(bottomOverlayHeight: floatingBarTotalHeight),
                  SettingsScreen(bottomOverlayHeight: floatingBarTotalHeight),
                ],
              ),
            ),
          ),

          Positioned(
            left: _navBarSideMargin,
            right: _navBarSideMargin,
            bottom: _navBarBottomMargin + bottomPadding,
            child: FadeTransition(
              opacity: _navFade,
              child: SlideTransition(
                position: _navSlide,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    height: _navBarHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: AppColors.deepSurface(
                        brightness,
                      ).withValues(alpha: 0.95),
                      border: Border.all(
                        color: AppColors.navBarBorder(brightness),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.5),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: const Color(
                            0xFFFF4654,
                          ).withValues(alpha: 0.06),
                          blurRadius: 40,
                          offset: const Offset(0, 4),
                          spreadRadius: -2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(_navItems.length, (index) {
                        final isSelected = _currentIndex == index;
                        final item = _navItems[index];

                        return Expanded(
                          child: _FloatingNavBarItem(
                            isSelected: isSelected,
                            label: item["label"]!,
                            iconPath: item["icon"],
                            materialIcon: item["materialIcon"],
                            onTap: () => _onTabTapped(index),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingNavBarItem extends StatefulWidget {
  final bool isSelected;
  final String label;
  final String? iconPath;
  final IconData? materialIcon;
  final VoidCallback onTap;

  const _FloatingNavBarItem({
    required this.isSelected,
    required this.label,
    this.iconPath,
    this.materialIcon,
    required this.onTap,
  });

  @override
  State<_FloatingNavBarItem> createState() => _FloatingNavBarItemState();
}

class _FloatingNavBarItemState extends State<_FloatingNavBarItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    const activeColor = AppColors.accent;
    final inactiveColor = AppColors.navInactive(brightness);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      behavior: HitTestBehavior.opaque,
      child: Center(
        child: AnimatedScale(
          scale: _isPressed ? 0.88 : (widget.isSelected ? 1.05 : 1.0),
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOutCubic,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: _isPressed ? 0.7 : 1.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.iconPath != null
                    ? ImageIcon(
                        AssetImage(widget.iconPath!),
                        size: 24,
                        color: widget.isSelected ? activeColor : inactiveColor,
                      )
                    : Icon(
                        widget.materialIcon,
                        size: 24,
                        color: widget.isSelected ? activeColor : inactiveColor,
                      ),
                const SizedBox(height: 5),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 10,
                    color: widget.isSelected ? activeColor : inactiveColor,
                    letterSpacing: 0.5,
                  ),
                  child: Text(widget.label),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
