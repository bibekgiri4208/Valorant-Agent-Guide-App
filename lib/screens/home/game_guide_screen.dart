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
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C252E),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "Game Guide",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 28,
            fontFamily: 'Valorant',
            letterSpacing: 2.0,
          ),
        ),
      ),
      body: Column(
        children: [
          // SEARCH & CATEGORY HEADER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                const SizedBox(height: 12),

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
              ],
            ),
          ),

          // EXPANDABLE GUIDE LIST
          Expanded(
            child: filteredGuides.isEmpty
                ? const Center(
                    child: Text(
                      "NO PROTOCOL DATA FOUND",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Valorant',
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    itemCount: filteredGuides.length,
                    itemBuilder: (context, index) {
                      final item = filteredGuides[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade800),
                        ),
                        child: Material(
                          color: const Color(0xFF12181F),
                          borderRadius: BorderRadius.circular(12),
                          clipBehavior: Clip.antiAlias,
                          child: Theme(
                            data: Theme.of(
                              context,
                            ).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              leading: Icon(
                                item['icon'] as IconData,
                                color: const Color(0xFFFF4654),
                                size: 22,
                              ),
                              title: Text(
                                "${item['num']} // ${item['title']}",
                                style: const TextStyle(
                                  fontFamily: 'Valorant',
                                  fontSize: 13,
                                  color: Colors.white,
                                  letterSpacing: 1.1,
                                ),
                              ),
                              iconColor: const Color(0xFFFF4654),
                              collapsedIconColor: Colors.grey,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    16,
                                    0,
                                    16,
                                    16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        color: Colors.white24,
                                        thickness: 1,
                                      ),
                                      const SizedBox(height: 8),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
