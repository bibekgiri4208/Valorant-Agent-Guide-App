import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/game_guide_data.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';

class GameGuideScreen extends StatefulWidget {
  final double bottomOverlayHeight;
  const GameGuideScreen({super.key, this.bottomOverlayHeight = 0});

  @override
  State<GameGuideScreen> createState() => _GameGuideScreenState();
}

class _GameGuideScreenState extends State<GameGuideScreen> {
  String _selectedCategory = "ALL";
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final filteredGuides = gameGuidesData.where((guide) {
      final matchesCategory =
          _selectedCategory == "ALL" || guide['category'] == _selectedCategory;
      final matchesSearch =
          guide['title'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          guide['content'].toString().toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
            backgroundColor: Colors.transparent,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          // APP BAR
          SliverAppBar(
      backgroundColor: AppColors.scaffold(Theme.of(context).brightness),
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            pinned: true,
            title: Text(
              "Game Guide",
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

          // HEADER
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
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
                        "// PROTOCOL DATABASE",
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
                    "MASTER THE\nGAME MECHANICS",
                    style: TextStyle(
                      fontFamily: 'Valorant',
                      fontSize: 28,
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
                  const SizedBox(height: 20),

                  // Search Bar with Filter
                  TextField(
                    onChanged: (value) => setState(() => _searchQuery = value),
                    style: TextStyle(fontFamily: 'Gabarito', color: AppColors.textPrimary(brightness), fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Search tactics, economy, mechanics...",
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
                          return gameGuideCategories.map((category) {
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
          ),

          // GUIDE CARDS
          if (filteredGuides.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Text(
                  "NO PROTOCOL DATA FOUND",
                  style: TextStyle(color: AppColors.textSecondary(brightness), fontFamily: 'Valorant'),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList.separated(
                itemCount: filteredGuides.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _GuideCard(item: filteredGuides[index]);
                },
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: SizedBox(height: widget.bottomOverlayHeight),
          ),
        ],
      ),
    );
  }
}

class _GuideCard extends StatefulWidget {
  final Map<String, dynamic> item;
  const _GuideCard({required this.item});

  @override
  State<_GuideCard> createState() => _GuideCardState();
}

class _GuideCardState extends State<_GuideCard> {
  bool _expanded = false;

  Color _categoryColor(String category) {
    switch (category) {
      case "MECHANICS":
        return AppColors.accent;
      case "ECONOMY":
        return AppColors.teal;
      case "TEAMWORK":
        return AppColors.blue;
      case "TACTICS":
        return AppColors.gold;
      default:
        return AppColors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final item = widget.item;
    final categoryColor = _categoryColor(item['category'] as String);

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: AppColors.card(brightness),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _expanded
                ? categoryColor.withValues(alpha: 0.4)
                : AppColors.divider(brightness),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // HEADER ROW
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  // Icon Container
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: categoryColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Title & Category
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${item['num']} // ${item['title']}",
                          style: TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 13,
                            color: AppColors.textPrimary(brightness),
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: categoryColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            item['category'] as String,
                            style: TextStyle(
                              fontFamily: 'Valorant',
                              fontSize: 8,
                              color: categoryColor,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Expand Arrow
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
                          Text(
                            item['content'] as String,
                            style: TextStyle(
                              fontFamily: 'Gabarito',
                              color: AppColors.textSecondary(brightness),
                              fontSize: 13,
                              height: 1.5,
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
    );
  }
}
