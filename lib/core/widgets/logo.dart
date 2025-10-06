import 'package:flutter/material.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';

class YouTubeMusicLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Radii (scaled based on size)
    double outerRadius = size.width * 0.40; // outermost red ring
    double middleRadius = size.width * 0.22; // white circle
    double innerRadius = size.width * 0.19; // red inner circle

    // Outer red circle
    final outerPaint = Paint()..color = ColorConstants.primaryRed;
    canvas.drawCircle(center, outerRadius, outerPaint);

    // Middle white circle
    final middlePaint = Paint()..color = ColorConstants.pureWhite;
    canvas.drawCircle(center, middleRadius, middlePaint);

    // Inner red circle
    final innerPaint = Paint()..color = ColorConstants.primaryRed;
    canvas.drawCircle(center, innerRadius, innerPaint);

    // Play triangle (auto scales with size)
    final trianglePaint = Paint()..color = ColorConstants.pureWhite;
    final double triWidth = size.width * 0.08;
    final double triHeight = size.width * 0.12;

    final path = Path();
    path.moveTo(center.dx - triWidth / 2, center.dy - triHeight / 2);
    path.lineTo(center.dx + triWidth / 2, center.dy);
    path.lineTo(center.dx - triWidth / 2, center.dy + triHeight / 2);
    path.close();
    canvas.drawPath(path, trianglePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
