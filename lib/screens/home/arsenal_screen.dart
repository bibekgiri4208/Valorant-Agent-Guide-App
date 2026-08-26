import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/arsenal_data.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';

class ArsenalScreen extends StatefulWidget {
  final double bottomOverlayHeight;
  const ArsenalScreen({super.key, this.bottomOverlayHeight = 0});

  @override
  State<ArsenalScreen> createState() => _ArsenalScreenState();
}

class _ArsenalScreenState extends State<ArsenalScreen> {
  String _selectedCategory = "ALL";
  String _searchQuery = "";
  bool _initialAnimDone = false;

  List<Map<String, dynamic>> get _filteredWeapons {
    return arsenalData.where((weapon) {
      final matchesCategory =
          _selectedCategory == "ALL" || weapon['category'] == _selectedCategory;
      final matchesSearch =
          weapon['name'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          weapon['description'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) setState(() => _initialAnimDone = true);
      });
    });
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
          "ARSENAL",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 30,
            fontFamily: 'Valorant',
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 18,
                      color: AppColors.accent,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "// WEAPON DATABASE",
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
                  "TACTICAL\nARSENAL",
                  style: TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 28,
                    color: AppColors.textPrimary(brightness),
                    height: 1.15,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) => setState(() => _searchQuery = value),
                  style: TextStyle(
                    fontFamily: 'Gabarito',
                    color: AppColors.textPrimary(brightness),
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: "Search weapons...",
                    hintStyle: TextStyle(
                      fontFamily: 'Gabarito',
                      color: AppColors.textSecondary(brightness),
                      fontSize: 13,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.accent,
                    ),
                    suffixIcon: PopupMenuButton<String>(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: _selectedCategory != "ALL"
                              ? AppColors.accent.withValues(alpha: 0.15)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.filter_list_rounded,
                          color: _selectedCategory != "ALL"
                              ? AppColors.accent
                              : AppColors.textSecondary(brightness),
                          size: 22,
                        ),
                      ),
                      color: AppColors.card(brightness),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: AppColors.divider(brightness)),
                      ),
                      onSelected: (value) {
                        setState(() => _selectedCategory = value);
                      },
                      itemBuilder: (context) {
                        return arsenalCategories.map((category) {
                          final isSelected = _selectedCategory == category;
                          return PopupMenuItem<String>(
                            value: category,
                            child: Row(
                              children: [
                                if (isSelected)
                                  Icon(Icons.check, color: AppColors.accent, size: 18)
                                else
                                  const SizedBox(width: 18),
                                const SizedBox(width: 10),
                                Text(
                                  category,
                                  style: TextStyle(
                                    fontFamily: 'Valorant',
                                    fontSize: 12,
                                    color: isSelected
                                        ? AppColors.accent
                                        : AppColors.textPrimary(brightness),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList();
                      },
                    ),
                    filled: true,
                    fillColor: AppColors.card(brightness),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.divider(brightness)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.accent),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: _filteredWeapons.isEmpty
                  ? Center(
                      key: const ValueKey('empty'),
                      child: Text(
                        "NO WEAPONS FOUND",
                        style: TextStyle(
                          color: AppColors.textSecondary(brightness),
                          fontFamily: 'Valorant',
                        ),
                      ),
                    )
                  : ListView.builder(
                      key: ValueKey(_selectedCategory),
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      padding: EdgeInsets.fromLTRB(20, 0, 20, widget.bottomOverlayHeight + 20),
                      itemCount: _filteredWeapons.length,
                    itemBuilder: (context, index) {
                      return _WeaponCard(
                        weapon: _filteredWeapons[index],
                        brightness: brightness,
                        index: index,
                        skipInitialAnim: _initialAnimDone,
                      );
                    },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeaponCard extends StatefulWidget {
  final Map<String, dynamic> weapon;
  final Brightness brightness;
  final int index;
  final bool skipInitialAnim;

  const _WeaponCard({
    required this.weapon,
    required this.brightness,
    required this.index,
    this.skipInitialAnim = false,
  });

  @override
  State<_WeaponCard> createState() => _WeaponCardState();
}

class _WeaponCardState extends State<_WeaponCard> with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    ));
    
    if (widget.skipInitialAnim) {
      _animController.value = 1.0;
    } else {
      Future.delayed(Duration(milliseconds: widget.index * 50), () {
        if (mounted) _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = widget.brightness;
    final weapon = widget.weapon;

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: GestureDetector(
          onTap: () => setState(() => _expanded = !_expanded),
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.card(brightness),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _expanded
                ? AppColors.accent.withValues(alpha: 0.4)
                : AppColors.divider(brightness),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        weapon['icon'],
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                        color: Colors.white,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weapon['name'],
                          style: TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 14,
                            color: AppColors.textPrimary(brightness),
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.accent.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                weapon['category'],
                                style: TextStyle(
                                  fontFamily: 'Valorant',
                                  fontSize: 8,
                                  color: AppColors.accent,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "${weapon['cost']} CREDITS",
                              style: TextStyle(
                                fontFamily: 'Gabarito',
                                fontSize: 10,
                                color: AppColors.textSecondary(brightness),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textSecondary(brightness),
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),

            // STATS ROW
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatChip("HEAD", weapon['headDamage'], brightness),
                  _buildStatChip("BODY", weapon['bodyDamage'], brightness),
                  _buildStatChip("LEG", weapon['legDamage'], brightness),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // EXPANDED CONTENT
            AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: _expanded
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(color: AppColors.divider(brightness), thickness: 1),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              _buildMiniStat("MAG", weapon['magazine'], brightness),
                              const SizedBox(width: 16),
                              _buildMiniStat("FIRE RATE", weapon['fireRate'], brightness),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            weapon['description'],
                            style: TextStyle(
                              fontFamily: 'Gabarito',
                              color: AppColors.textSecondary(brightness),
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.scaffold(brightness),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.divider(brightness),
                              ),
                            ),
                            child: Text(
                              weapon['guide'],
                              style: TextStyle(
                                fontFamily: 'Gabarito',
                                color: AppColors.textSecondary(brightness),
                                fontSize: 11,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
        ),
      ),
    );
  }

  Widget _buildStatChip(String label, String value, Brightness brightness) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Gabarito',
              fontSize: 10,
              color: AppColors.textPrimary(brightness),
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Valorant',
              fontSize: 8,
              color: AppColors.accent,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(String label, String value, Brightness brightness) {
    return Row(
      children: [
        Text(
          "$label: ",
          style: TextStyle(
            fontFamily: 'Valorant',
            fontSize: 9,
            color: AppColors.textSecondary(brightness),
            letterSpacing: 0.5,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Gabarito',
            fontSize: 11,
            color: AppColors.textPrimary(brightness),
          ),
        ),
      ],
    );
  }
}
