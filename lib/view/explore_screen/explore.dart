import 'package:flutter/material.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';
import 'package:yt_music_clone/core/widgets/logo.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          spacing: 10,
          children: [
            CustomPaint(size: Size(40, 40), painter: YouTubeMusicLogoPainter()),
            Text("Music", style: TextStyle(color: ColorConstants.pureWhite)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: ColorConstants.pureWhite),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(radius: 19),
          ),
        ],
      ),
    );
  }
}
