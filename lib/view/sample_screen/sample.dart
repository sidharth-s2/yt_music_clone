import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';
import 'package:yt_music_clone/core/widgets/logo.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  // 🎥 List of video URLs
  final List<String> videoUrls = [
    'https://www.pexels.com/download/video/15411270/',
    'https://www.pexels.com/download/video/7352268/',
    'https://www.pexels.com/download/video/8041860/',
  ];

  late PageController _pageController;
  final List<VideoPlayerController> _videoControllers = [];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Initialize all video controllers
    for (var url in videoUrls) {
      final controller = VideoPlayerController.networkUrl(Uri.parse(url))
        ..initialize().then((_) {
          setState(() {});
        });
      _videoControllers.add(controller);
    }

    // Auto-play first video
    _videoControllers.first.play();
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Pause all videos except the current one
    for (int i = 0; i < _videoControllers.length; i++) {
      if (i == index) {
        _videoControllers[i].play();
      } else {
        _videoControllers[i].pause();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundDark,
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundDark,
        elevation: 0,
        title: Row(
          children: [
            CustomPaint(
              size: const Size(40, 40),
              painter: YouTubeMusicLogoPainter(),
            ),
            const SizedBox(width: 10),
            Text("Samples", style: TextStyle(color: ColorConstants.pureWhite)),
          ],
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          final controller = _videoControllers[index];

          return Stack(
            alignment: Alignment.center,
            children: [
              // Background video
              controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    )
                  : const Center(child: CircularProgressIndicator()),

              // Gradient overlay for text and icons
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  ),
                ),
              ),

              // Overlay UI
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left side text
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Video ${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "Artist / Album name",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),

                      // Right side icons
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 32,
                          ),
                          SizedBox(height: 20),
                          Icon(Icons.comment, color: Colors.white, size: 32),
                          SizedBox(height: 20),
                          Icon(Icons.share, color: Colors.white, size: 32),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
