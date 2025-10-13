import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class MusicShortsScreen extends StatefulWidget {
  const MusicShortsScreen({super.key});

  @override
  State<MusicShortsScreen> createState() => _MusicShortsScreenState();
}

class _MusicShortsScreenState extends State<MusicShortsScreen> {
  final List<Map<String, dynamic>> videos = [
    {
      "url":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      "title": "Venmegam",
      "artist": "Anirudh • Shankar Raja • Hariharan",
      "likes": 607,
      "comments": [],
      "isLiked": false,
    },
    {
      "url":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      "title": "Munbe Vaa",
      "artist": "Shreya Ghoshal • Harris Jayaraj",
      "likes": 912,
      "comments": [],
      "isLiked": false,
    },
    {
      "url":
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      "title": "Kadhal Sadugudu",
      "artist": "A.R. Rahman • S.P. Balasubrahmanyam",
      "likes": 504,
      "comments": [],
      "isLiked": false,
    },
  ];

  final List<VideoPlayerController> _controllers = [];
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    for (var v in videos) {
      final controller = VideoPlayerController.network(v["url"])
        ..initialize().then((_) {
          setState(() {});
        });
      controller.addListener(() {
        if (controller.value.isInitialized &&
            controller.value.position >= controller.value.duration) {
          _nextVideo();
        }
      });
      _controllers.add(controller);
    }
    _controllers.first.play();
  }

  void _nextVideo() {
    int nextIndex = (_currentIndex + 1) % videos.length;
    _pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
    for (int i = 0; i < _controllers.length; i++) {
      if (i == index) {
        _controllers[i].play();
      } else {
        _controllers[i].pause();
      }
    }
  }

  void _toggleLike(int index) {
    setState(() {
      videos[index]["isLiked"] = !videos[index]["isLiked"];
      if (videos[index]["isLiked"]) {
        videos[index]["likes"]++;
      } else {
        videos[index]["likes"]--;
      }
    });
  }

  void _showCommentsSheet(int index) {
    final TextEditingController commentController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: SizedBox(
                        width: 50,
                        child: Divider(thickness: 10, color: Colors.white24),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Comments",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // 🗨️ Comment List
                    Expanded(
                      child: ListView.builder(
                        itemCount: videos[index]["comments"].length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://i.pravatar.cc/150?img=5",
                              ),
                            ),
                            title: Text(
                              videos[index]["comments"][i],
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),

                    // ✍️ Add comment field
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: commentController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Add a comment...",
                              hintStyle: const TextStyle(
                                color: Colors.white54,
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor: Colors.white12,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: const Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                            if (commentController.text.isNotEmpty) {
                              setState(() {
                                videos[index]["comments"].add(
                                  commentController.text.trim(),
                                );
                              });
                              setModalState(() {});
                              commentController.clear();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          final controller = _controllers[index];

          return Stack(
            fit: StackFit.expand,
            children: [
              // 🎥 Video Player with tap-to-play/pause
              GestureDetector(
                onTap: () {
                  setState(() {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  });
                },
                child: controller.value.isInitialized
                    ? FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: controller.value.size.width,
                          height: controller.value.size.height,
                          child: VideoPlayer(controller),
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),

              // 🎨 Gradient Overlay
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
              ),

              // ⬆️ Video Progress Bar
              if (controller.value.isInitialized)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(
                    value:
                        controller.value.position.inMilliseconds /
                        controller.value.duration.inMilliseconds,
                    backgroundColor: Colors.white24,
                    color: Colors.redAccent,
                    minHeight: 3,
                  ),
                ),

              // 🧭 Top Bar
              // SafeArea(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 16,
              //       vertical: 10,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: const [
              //         Row(
              //           children: [
              //             Icon(
              //               Icons.play_circle_fill,
              //               color: Colors.red,
              //               size: 28,
              //             ),
              //             SizedBox(width: 6),
              //             Text(
              //               "Music",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 18,
              //               ),
              //             ),
              //           ],
              //         ),
              //         // Icon(Icons.more_vert, color: Colors.white),
              //       ],
              //     ),
              //   ),
              // ),

              // 🎵 Song Info (bottom left)
              Positioned(
                left: 16,
                bottom: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video["title"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      video["artist"],
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.black),
                      label: const Text("Play"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ❤️ Right-side Action Buttons
              Positioned(
                right: 16,
                bottom: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // 👍 Like button
                    IconButton(
                      icon: Icon(
                        video["isLiked"]
                            ? Icons.thumb_up_alt
                            : Icons.thumb_up_alt_outlined,
                        color: video["isLiked"]
                            ? Colors.redAccent
                            : Colors.white,
                        size: 32,
                      ),
                      onPressed: () => _toggleLike(index),
                    ),
                    Text(
                      "${video["likes"]}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 20),

                    // 💬 Comment
                    IconButton(
                      icon: const Icon(
                        Icons.comment_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () => _showCommentsSheet(index),
                    ),
                    Text(
                      "${video["comments"].length}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    const SizedBox(height: 20),

                    // 💾 Save
                    IconButton(
                      icon: const Icon(
                        Icons.save_alt,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        // Save video logic
                      },
                    ),
                    const SizedBox(height: 20),

                    // 🔗 Share
                    IconButton(
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () {
                        Share.share(videos[_currentIndex]["url"]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
