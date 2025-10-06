import 'package:flutter/material.dart';
import 'package:yt_music_clone/core/widgets/logo.dart';
import 'package:yt_music_clone/view/login_screen/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CustomPaint(
              size: Size(150, 150),
              painter: YouTubeMusicLogoPainter(),
            ),
          ],
        ),
      ),
    );
  }
}
