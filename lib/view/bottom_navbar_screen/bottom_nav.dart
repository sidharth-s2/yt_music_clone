import 'package:flutter/cupertino.dart' show CupertinoColors;
import 'package:flutter/material.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';
import 'package:yt_music_clone/view/explore_screen/explore.dart';
import 'package:yt_music_clone/view/home_screen/home_screen.dart';
import 'package:yt_music_clone/view/library_screen/library.dart';
import 'package:yt_music_clone/view/sample_screen/sample.dart';
import 'package:yt_music_clone/view/updrade_screen/updrade.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(),
      MusicShortsScreen(),
      Explore(),
      Library(),
      Updrade(),
    ];

    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        onTap: (index) {
          current_index = index;
          setState(() {});
        },
        backgroundColor: ColorConstants.borderDark,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CupertinoColors.tertiarySystemBackground,
        unselectedItemColor: Color(0xffffffff),
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),

        unselectedLabelStyle: TextStyle(fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: "sample",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: "explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            label: "library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill),
            label: "upgrade",
          ),
        ],
      ),
    );
  }
}
