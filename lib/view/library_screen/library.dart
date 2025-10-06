import 'package:flutter/material.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Library",
          style: TextStyle(color: ColorConstants.pureWhite),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.history, color: ColorConstants.pureWhite),
          ),
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
