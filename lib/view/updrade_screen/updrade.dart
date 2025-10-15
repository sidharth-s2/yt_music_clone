import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';
import 'package:yt_music_clone/core/widgets/logo.dart';
import 'package:yt_music_clone/view/global_widgets/myplancard.dart';
import 'package:yt_music_clone/view/home_screen/home_screen.dart';

class Updrade extends StatefulWidget {
  const Updrade({super.key});

  @override
  State<Updrade> createState() => _UpdradeState();
}

class _UpdradeState extends State<Updrade> {
  final List<String> questions = const [
    'How do I play videos and music in the background?',
    'What products support Premium?',
    'How many members can I add to a plan?',
    'How can I cancel my subscription?',
  ];
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;

  void initState() {
    super.initState();

    // Create a network video controller
    _controller =
        VideoPlayerController.network(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
          )
          ..initialize().then((_) {
            _controller
              ..setLooping(true) // repeat video
              // ..setVolume(0.) // full volume (set 0 for mute)
              ..play(); // auto play
            setState(() {}); // refresh UI after video is ready
          });
    //controller 2
    _controller2 =
        VideoPlayerController.network(
            'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
          )
          ..initialize().then((_) {
            _controller2
              ..setLooping(true)
              ..setVolume(1.0)
              ..play();
            setState(() {});
          });
    void dispose() {
      _controller.dispose();
      _controller2.dispose();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundDark,
        title: Row(
          spacing: 10,
          children: [
            CustomPaint(
              size: const Size(40, 40),
              painter: YouTubeMusicLogoPainter(),
            ),
            Text("Music", style: TextStyle(color: ColorConstants.pureWhite)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: ColorConstants.pureWhite),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(radius: 19),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        // ✅ Added scroll view
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.play_circle_fill, color: Colors.red, size: 45),
                SizedBox(width: 6),
                Text(
                  "YouTube Music",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Description
            const Text(
              "Get Music Premium to\nlisten to music ad-free,\noffline & with your screen off",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 27),

            const Text(
              "Prepaid and monthly plans available.\nStarts at ₹119.00/month. Free trials with monthly plans.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 19),
            ),

            const SizedBox(height: 30),

            // Get Music Premium Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Get Music Premium",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Shared/student plan
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Or save money with a ",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  TextSpan(
                    text: "shared ",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                  TextSpan(
                    text: "or ",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  TextSpan(
                    text: "student plan",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Terms
            const Text(
              "By continuing, you verify that you are at least 18 years old and agree to these terms. No refunds for partial billing periods.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54, fontSize: 11),
            ),
            const SizedBox(height: 5),
            const Text(
              "Restrictions apply.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 12),
            ),
            SizedBox(height: 150),
            Text(
              "Over 100M songs, videos,\n  live performances, and\n  more at your fingertips",
              style: TextStyle(
                color: Colors.white,
                fontSize: 31,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),

            const SizedBox(height: 50),

            // 1️⃣ Feature 1
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1DB954).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.block,
                    color: Color(0xFF1DB954),
                    size: 35,
                  ),
                ),
                SizedBox(width: 29),
                Expanded(
                  child: Text(
                    "\nListen ad-free to your favorite songs\nand artists",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // 2️⃣ Feature 2
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1DB954).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.download_for_offline,
                    color: Color(0xFF1DB954),
                    size: 35,
                  ),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    "\nDownload offline to listen on the go or play in the background for an uninterrupted experience",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            // 3️⃣ Feature 3
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1DB954).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.graphic_eq,
                    color: Color(0xFF1DB954),
                    size: 35,
                  ),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    "Switch from audio to video when listening to songs with just a tap",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            Text(
              "Pick a membership that\n            fits you",
              style: TextStyle(
                color: ColorConstants.pureWhite,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            PlanCard(
              title: 'Individual',
              price: '₹119.00/month',
              subtitle: 'Prepaid or monthly\nFree trials with monthly plans',
              buttonText: 'Get Music Premium',
              buttonColor: Colors.lightBlue,
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            PlanCard(
              title: 'Family',
              price: '₹179.00/month',
              subtitle:
                  '1-month trial for ₹0\nAdd up to 5 family members (ages 13+)',
              buttonText: 'Try 1 month for ₹0',
              buttonColor: Color(0xFF0D47A1),
              icon: Icons.family_restroom_outlined,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            PlanCard(
              title: 'two person',
              price: '₹149.00/month',
              subtitle:
                  '1-month trial for ₹0\nAdd up to 5 family members (ages 13+)',
              buttonText: 'Try 1 month for ₹0',
              buttonColor: Color(0xFF0D47A1),
              icon: Icons.group,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            PlanCard(
              title: 'Student',
              price: '₹59.00/month',
              subtitle:
                  '1-month trial for ₹0\neligible students only.annual verification required.\nrestriction apply',
              buttonText: 'Try 1 month for ₹0',
              buttonColor: Color(0xFF0D47A1),
              icon: Icons.cast_for_education,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            SizedBox(height: 80),
            Text(
              "YouTube Music, your Way",
              style: TextStyle(
                color: ColorConstants.pureWhite,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 25),
            Text(
              "These features are avalilable in the Youtube\n         music app without a subscription",
              style: TextStyle(color: ColorConstants.pureWhite, fontSize: 16),
            ),
            SizedBox(height: 45),
            SizedBox(height: 150, width: 300, child: VideoPlayer(_controller)),
            SizedBox(height: 40),
            Text(
              "Move to your own rhythm",
              style: TextStyle(
                color: ColorConstants.pureWhite,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 17),
            Text(
              "Listen to mixes based on the music you love,and discoverd thousands of other playlists curated to\n match any mood or moment..",
              style: TextStyle(color: ColorConstants.pureWhite),
            ),
            SizedBox(height: 30),
            Container(
              height: 300,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: VideoPlayer(_controller2),
            ),
            SizedBox(height: 20),
            Text(
              "Customize your listening \n experiance",
              style: TextStyle(
                color: ColorConstants.pureWhite,
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "combine your favorite artists and fine-tune your\n own music experiance",
              style: TextStyle(color: ColorConstants.pureWhite),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Questions? We\'re here to help.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.pureWhite,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    itemCount: questions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        title: Text(
                          questions[index],
                          style: TextStyle(color: ColorConstants.pureWhite),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Answer content goes here. You can customize this per question.',
                              style: TextStyle(color: ColorConstants.pureWhite),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const Divider(),

                  // Help Center link
                  GestureDetector(
                    onTap: () {
                      // TODO: Add your help center link logic here
                    },
                    child: const Text(
                      'Other questions? Visit the Help Center',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
