import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';
import 'package:valorant_guide_app/theme/settings_provider.dart';

class AgentsDetailScreen extends StatefulWidget {
  final Map<String, dynamic> agentData;

  const AgentsDetailScreen({super.key, required this.agentData});

  @override
  State<AgentsDetailScreen> createState() => _AgentsDetailScreenState();
}

class _AgentsDetailScreenState extends State<AgentsDetailScreen> {
  late final PageController _pageController;
  int _selectedIndex = 0;

  // Keybind mappings for Valorant abilities
  final List<String> _keybinds = const ["KEY C", "KEY Q", "KEY E", "ULT X"];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _pageController.addListener(() {
      if (_pageController.hasClients && _pageController.page != null) {
        final currentRoundIndex = _pageController.page!.round();
        if (currentRoundIndex != _selectedIndex) {
          setState(() {
            _selectedIndex = currentRoundIndex;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onAbilitySelected(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final brightness = Theme.of(context).brightness;
    final agent = widget.agentData;
    final List abilities = agent['abilities'] ?? [];

    return Scaffold(
      backgroundColor: AppColors.scaffold(brightness),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // HEADER SECTION
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(60),
                ),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.52,
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0.0, -0.2),
                      radius: 0.85,
                      colors: [
                        Color(0xFFFF4654),
                        Color(0xFFB52331),
                        Color(0xFF1C252E),
                      ],
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (agent['roleIcon'] != null)
                        Positioned(
                          top: 30,
                          child: Opacity(
                            opacity: 0.25,
                            child: Image.asset(
                              agent['roleIcon'],
                              height: 260,
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),
                        ),

                      Column(
                        children: [
                          const Spacer(),
                          SizedBox(
                            height: 310,
                            child: Hero(
                              tag: 'agent_image_${agent['name']}',
                              child: Image.asset(
                                agent['image'] ?? '',
                                fit: BoxFit.contain,
                                cacheHeight: 800,
                                gaplessPlayback: true,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            agent['name'] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Valorant",
                              letterSpacing: 1.5,
                              shadows: [
                                Shadow(
                                  color: Colors.black54,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            agent['role'] ?? '',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontFamily: "Valorant",
                              letterSpacing: 2,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),

                      // TOP BACK BUTTON
                      Positioned(
                        top: 10,
                        left: 10,
                        child: IconButton(
                          icon: Image.asset(
                            'assets/icon/back_arrow.png',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),

                      // TOP RIGHT INFO BUTTON
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          icon:                           Icon(
                            Icons.info_outline_rounded,
                            size: 26,
                            color: Colors.white,
                          ),
                          onPressed: () => _showAgentInfoModal(context, agent),
                ),
              ),
            ],
                  ),
                ),
              ),

              // ABILITY SELECTION BAR
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SPECIAL ABILITIES",
                      style: TextStyle(
                        color: AppColors.textPrimary(brightness),
                        fontFamily: "Valorant",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(abilities.length, (index) {
                        final isSelected = _selectedIndex == index;
                        return GestureDetector(
                          onTap: () => _onAbilitySelected(index),
                          child: Column(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.accent
                                      : AppColors.card(brightness),
                                  border: Border.all(
                                    color: isSelected
                                        ? AppColors.accent
                                        : AppColors.divider(brightness),
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: AppColors.accent
                                                .withValues(alpha: 0.4),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Image.asset(
                                    abilities[index]['icon'],
                                    fit: BoxFit.contain,
                                    color: isSelected
                                        ? Colors.white
                                        : AppColors.textSecondary(brightness),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 4,
                                width: isSelected ? 20 : 0,
                                decoration: BoxDecoration(
                                  color: AppColors.accent,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              // PAGE VIEW FOR ABILITY CARDS
              SizedBox(
                height: 460,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: abilities.length,
                  itemBuilder: (context, index) {
                    final ability = abilities[index];
                    final defaultSlot = index < _keybinds.length
                        ? _keybinds[index]
                        : 'ABILITY ${index + 1}';

                    return _buildAbilityPage(
                      title: ability['name'] ?? '',
                      description: ability['description'] ?? '',
                      slot: ability['slot'] ?? defaultSlot,
                      videoPath: ability['video'] ?? ability['videoUrl'],
                      brightness: brightness,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAgentInfoModal(BuildContext context, Map<String, dynamic> agent) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card(Theme.of(context).brightness),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        final brightness = Theme.of(context).brightness;
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.65,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textSecondary(brightness),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    color: AppColors.accent,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "AGENT DOSSIER",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Valorant",
                      color: AppColors.textPrimary(brightness),
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
              const SizedBox(height: 16),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.scaffold(brightness),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.divider(brightness)),
                        ),
                        child: Column(
                          children: [
                            _buildInfoRow("ROLE", agent['role'] ?? '', brightness),
                            Divider(color: AppColors.divider(brightness).withValues(alpha: 0.12), height: 20),
                            _buildInfoRow(
                              "ORIGIN",
                              agent['country'] ?? 'Unknown',
                              brightness,
                            ),
                            Divider(color: AppColors.divider(brightness).withValues(alpha: 0.12), height: 20),
                            _buildInfoRow(
                              "NUMBER",
                              "#${agent['agentNumber'] ?? ''}",
                              brightness,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.scaffold(brightness),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.divider(brightness)),
                        ),
                        child: Text(
                          agent['summary'] ?? '',
                          style: TextStyle(
                            fontFamily: 'Gabarito',
                            fontSize: 14,
                            color: AppColors.textSecondary(brightness),
                            height: 1.6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value, Brightness brightness) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textSecondary(brightness),
            fontFamily: "Valorant",
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: AppColors.textPrimary(brightness),
            fontFamily: "Valorant",
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildAbilityPage({
    required String title,
    required String description,
    required String slot,
    required Brightness brightness,
    String? videoPath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card(brightness),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.divider(brightness)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: AppColors.textPrimary(brightness),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Valorant",
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.accent.withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      slot.toUpperCase(),
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 10,
                        fontFamily: "Valorant",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (videoPath != null && videoPath.isNotEmpty) ...[
                AbilityVideoPlayer(videoPath: videoPath),
                const SizedBox(height: 14),
              ],
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.abilityDescBox(brightness),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.divider(brightness).withValues(alpha: 0.05),
                  ),
                ),
                child: Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Gabarito',
                    color: AppColors.textSecondary(brightness),
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AbilityVideoPlayer extends StatefulWidget {
  final String videoPath;

  const AbilityVideoPlayer({super.key, required this.videoPath});

  @override
  State<AbilityVideoPlayer> createState() => _AbilityVideoPlayerState();
}

class _AbilityVideoPlayerState extends State<AbilityVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    final isNetwork =
        widget.videoPath.startsWith('http://') ||
        widget.videoPath.startsWith('https://');

    _controller = isNetwork
        ? VideoPlayerController.networkUrl(Uri.parse(widget.videoPath))
        : VideoPlayerController.asset(widget.videoPath);

    _controller.setLooping(true);
    _controller.setVolume(0.0);
    _controller.initialize().then((_) {
      if (mounted) {
        setState(() {});
        final settingsProvider = Provider.of<SettingsProvider>(
          context,
          listen: false,
        );
        if (settingsProvider.autoplayEnabled) {
          _controller.play();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (!_controller.value.isInitialized) {
      return Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.scaffold(brightness),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider(brightness)),
        ),
        child: Center(
          child: CircularProgressIndicator(color: AppColors.accent),
        ),
      );
    }

    return GestureDetector(
      onTap: _togglePlayPause,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divider(brightness)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              if (!_controller.value.isPlaying)
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withValues(alpha: 0.4),
                        blurRadius: 16,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
