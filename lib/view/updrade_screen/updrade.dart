import 'package:flutter/material.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';
import 'package:yt_music_clone/core/widgets/logo.dart';

class Updrade extends StatefulWidget {
  const Updrade({super.key});

  @override
  State<Updrade> createState() => _UpdradeState();
}

class _UpdradeState extends State<Updrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backgroundDark,
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
