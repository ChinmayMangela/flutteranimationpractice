import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // Color(0xFFE0F3EB), // Light mint green
            // Color(0xFFF0F0F0), // Soft off-whites
            // Color(0xFFF5F5F5), // Off-white (light, clean)
            // Color(0xFFDAF1CE), // Mint Green (fresh and light)
            // Color(0xFFFCF9F5), // Off-white (light ivory)
            // Color(0xFFD7E4D1), // Light moss green
            Color(0xFFDDE8D7), // Soft sage grayish-green
            Color(0xFFF0F2F1), // Light gray
          ],
        ),
      ),
    );
  }
}
