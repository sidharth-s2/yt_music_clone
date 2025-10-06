import 'package:flutter/material.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';
import 'package:yt_music_clone/core/constants/image_constas.dart';

import 'package:yt_music_clone/core/widgets/logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
            icon: const Icon(Icons.notifications),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 15,
              // backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstas.bgimg),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black, Colors.black],
                stops: [0.5, 0.8, 0.1],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: kToolbarHeight + 20,
              left: 12,
              right: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
