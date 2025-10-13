import 'package:flutter/material.dart';
import 'package:yt_music_clone/core/constants/color_constats.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;
  final String buttonText;
  final Color buttonColor;
  final IconData icon;
  final VoidCallback onTap; // Required callback for tap

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    required this.buttonText,
    required this.buttonColor,
    required this.icon,
    required this.onTap, // Pass the function when creating the card
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap, // Tap anywhere on the card triggers this
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plan Header
            Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    color: ColorConstants.pureWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Price
            Text(
              price,
              style: TextStyle(
                color: ColorConstants.pureWhite,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),

            // Subtitle
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
            const SizedBox(height: 16),

            // Button (optional duplicate action)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: onTap, // Same callback as onTap
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
