import 'package:flutter/material.dart';
import 'package:valorant_guide_app/data/game_guide_data.dart';

class GameGuideScreen extends StatefulWidget {
  const GameGuideScreen({super.key});

  @override
  State<GameGuideScreen> createState() => _GameGuideScreenState();
}

class _GameGuideScreenState extends State<GameGuideScreen> {
  String _selectedCategory = "ALL";
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: const Color(0xFF1C252E),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          // APP BAR
          SliverAppBar(
            backgroundColor: const Color(0xFF1C252E),
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            pinned: true,
            title: const Text(
              "Game Guide",
              style: TextStyle(
                color: Color(0xFFFF4654),
                fontSize: 30,
                fontFamily: 'Valorant',
                letterSpacing: 2.0,
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
                        color: const Color(0xFFFF4654),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "// PROTOCOL DATABASE",
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
                    "MASTER THE\nGAME MECHANICS",
                    style: TextStyle(
                      fontFamily: 'Valorant',
                      fontSize: 28,
                      color: Colors.white,
                      height: 1.15,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Search Bar
                  TextField(
                    onChanged: (value) => setState(() => _searchQuery = value),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      hintText: "Search tactics, economy, mechanics...",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFFFF4654),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF12181F),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFFFF4654)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Category Chips
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: gameGuideCategories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final category = gameGuideCategories[index];
                        final isSelected = _selectedCategory == category;
                        return ChoiceChip(
                          label: Text(
                            category,
                            style: TextStyle(
                              fontFamily: 'Valorant',
                              fontSize: 10,
                              color: isSelected ? Colors.black : Colors.white,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: const Color(0xFFFF4654),
                          backgroundColor: const Color(0xFF12181F),
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _selectedCategory = category);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // GUIDE CARDS
          if (filteredGuides.isEmpty)
            const SliverFillRemaining(
              child: Center(
                child: Text(
                  "NO PROTOCOL DATA FOUND",
                  style: TextStyle(color: Colors.grey, fontFamily: 'Valorant'),
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
        return const Color(0xFFFF4654);
      case "ECONOMY":
        return const Color(0xFF00D4AA);
      case "TEAMWORK":
        return const Color(0xFF5B8DEF);
      case "TACTICS":
        return const Color(0xFFFFB800);
      default:
        return const Color(0xFFFF4654);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final categoryColor = _categoryColor(item['category'] as String);

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: const Color(0xFF12181F),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _expanded
                ? categoryColor.withValues(alpha: 0.4)
                : Colors.grey.shade800,
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
                      color: categoryColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: categoryColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      color: categoryColor,
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
                          style: const TextStyle(
                            fontFamily: 'Valorant',
                            fontSize: 13,
                            color: Colors.white,
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
                      color: Colors.grey.shade600,
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
                          Divider(color: Colors.grey.shade800, thickness: 1),
                          const SizedBox(height: 10),
                          Text(
                            item['content'] as String,
                            style: const TextStyle(
                              color: Colors.grey,
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
