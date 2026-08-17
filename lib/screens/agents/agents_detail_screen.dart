import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AgentsDetailScreen extends StatefulWidget {
  final Map<String, dynamic> agentData;

  const AgentsDetailScreen({super.key, required this.agentData});

  @override
  State<AgentsDetailScreen> createState() => _AgentsDetailScreenState();
}

class _AgentsDetailScreenState extends State<AgentsDetailScreen> {
  late final PageController _pageController;
  int _selectedIndex = 0;

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
    final agent = widget.agentData;
    final List abilities = agent['abilities'] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFF1C252E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER SECTION
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(100),
                ),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.55,
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
                          top: 40,
                          child: Opacity(
                            opacity: 0.3,
                            child: Image.asset(
                              agent['roleIcon'],
                              height: 280,
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),
                        ),

                      Column(
                        children: [
                          const Spacer(),
                          SizedBox(
                            height: 350,
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
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: const Color(0xFF1C252E),
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                builder: (context) {
                                  return Container(
                                    constraints: BoxConstraints(
                                      maxHeight:
                                          MediaQuery.sizeOf(context).height *
                                          0.65,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 36,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              color: Colors.white24,
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        // Title Section
                                        Row(
                                          children: [
                                            Container(
                                              width: 3,
                                              height: 22,
                                              color: const Color(0xFFFF4654),
                                            ),
                                            const SizedBox(width: 8),
                                            const Text(
                                              "Agent Description",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontFamily: "Valorant",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),

                                        // Scrollable Content
                                        Flexible(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  padding: const EdgeInsets.all(
                                                    14,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withValues(
                                                          alpha: 0.05,
                                                        ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    border: Border.all(
                                                      color: Colors.white12,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Role: ${agent['role'] ?? ''}",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "Valorant",
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const Divider(
                                                        color: Colors.white,
                                                        height: 20,
                                                        thickness: 1,
                                                      ),
                                                      Text(
                                                        "Country: ${agent['country'] ?? 'Unknown'}",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "Valorant",
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const Divider(
                                                        color: Colors.white,
                                                        height: 20,
                                                        thickness: 1,
                                                      ),
                                                      Text(
                                                        "Agent No. ${agent['agentNumber'] ?? ''}",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "Valorant",
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                const SizedBox(height: 16),

                                                // Summary Card Container
                                                Container(
                                                  width: double.infinity,
                                                  padding: const EdgeInsets.all(
                                                    14,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withValues(
                                                          alpha: 0.05,
                                                        ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    border: Border.all(
                                                      color: Colors.white12,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    agent['summary'] ?? '',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.white,
                                                      height: 1.5,
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
                            },
                            child: Text(
                              agent['name'] ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Valorant",
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            agent['role'] ?? '',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontFamily: "Valorant",
                              letterSpacing: 2,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),

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
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "SPECIAL ABILITIES",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Valorant",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        abilities.length,
                        (index) => GestureDetector(
                          onTap: () => _onAbilitySelected(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: _selectedIndex == index
                                  ? const Color(0xFFFF4654)
                                  : Colors.transparent,
                              border: Border.all(color: Colors.white38),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                abilities[index]['icon'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 520,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: abilities.length,
                  itemBuilder: (context, index) {
                    final ability = abilities[index];
                    return _buildAbilityPage(
                      title: ability['name'] ?? '',
                      description: ability['description'] ?? '',
                      videoPath: ability['video'] ?? ability['videoUrl'],
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

  Widget _buildAbilityPage({
    required String title,
    required String description,
    String? videoPath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Valorant",
              ),
            ),
            const SizedBox(height: 15),
            if (videoPath != null && videoPath.isNotEmpty) ...[
              AbilityVideoPlayer(videoPath: videoPath),
              const SizedBox(height: 15),
            ],
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
          ],
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
        _controller.play();
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
    if (!_controller.value.isInitialized) {
      return Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: Color(0xFFFF4654)),
        ),
      );
    }

    return GestureDetector(
      onTap: _togglePlayPause,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            if (!_controller.value.isPlaying)
              Container(
                color: Colors.black38,
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.play_arrow,
                  size: 48,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
