import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/home/about_me_screen.dart';
import 'package:valorant_guide_app/screens/home/game_guide_screen.dart';
import 'package:valorant_guide_app/screens/home/home_screen.dart';
import 'package:valorant_guide_app/screens/home/roles_description_screen.dart';

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
  late final Animation<Offset> _navSlide;
  Key _homeKey = UniqueKey();

  final List<Map<String, String>> _navItems = const [
    {"label": "Home", "icon": "assets/logo/valorant_logo.png"},
    {"label": "Roles", "icon": "assets/icon/roles.png"},
    {"label": "Guide", "icon": "assets/icon/guide.png"},
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

    _homeSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
    ));

    _navSlide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
    ));

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
    return Scaffold(
      backgroundColor: const Color(0xFF1C252E),
      body: SlideTransition(
        position: _homeSlide,
        child: FadeTransition(
          opacity: _entryFade,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(key: _homeKey),
              const RolesDescriptionScreen(),
              const GameGuideScreen(),
              const AboutMeScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SlideTransition(
        position: _navSlide,
        child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF12181F),
          border: Border(
            top: BorderSide(
              color: Colors.white.withValues(alpha: 0.08),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_navItems.length, (index) {
            final isSelected = _currentIndex == index;
            final item = _navItems[index];

            return Expanded(
              child: _NavBarItem(
                isSelected: isSelected,
                label: item["label"]!,
                iconPath: item["icon"]!,
                onTap: () => _onTabTapped(index),
              ),
            );
          }),
        ),
      ),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final bool isSelected;
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.isSelected,
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFFFF4654);
    const inactiveColor = Colors.white54;

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
                // Icon
                ImageIcon(
                  AssetImage(widget.iconPath),
                  size: 24,
                  color: widget.isSelected ? activeColor : inactiveColor,
                ),

                const SizedBox(height: 5),

                // Label
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
