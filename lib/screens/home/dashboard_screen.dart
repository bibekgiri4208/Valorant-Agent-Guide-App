import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/home/about_me_screen.dart';
import 'package:valorant_guide_app/screens/home/home_screen.dart';
import 'package:valorant_guide_app/screens/home/roles_description_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    RolesDescriptionScreen(),
    Center(
      child: Text(
        "Duelist",
        style: TextStyle(color: Colors.white, fontFamily: 'Valorant'),
      ),
    ),
    AboutMeScreen(),
  ];

  final List<Map<String, String>> _navItems = const [
    {"label": "Home", "icon": "assets/logo/valorant_logo.png"},
    {"label": "Description", "icon": "assets/logo/controller_logo.png"},
    {"label": "Duelist", "icon": "assets/logo/duelist_logo.png"},
    {"label": "Developer", "icon": "assets/icon/about_us.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C252E),
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Container(
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
                onTap: () {
                  if (_currentIndex != index) {
                    setState(() => _currentIndex = index);
                  }
                },
              ),
            );
          }),
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
