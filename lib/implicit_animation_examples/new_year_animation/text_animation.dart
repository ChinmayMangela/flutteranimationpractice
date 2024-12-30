import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    super.key,
    required this.animationController,
    required this.textAnimation,
    required this.opacityAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> textAnimation;
  final Animation<double> opacityAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: textAnimation.value,
          child: FadeTransition(
            opacity: opacityAnimation,
            child: const Text('HAPPY NEW YEAR 2025',  style: TextStyle(
              color: Colors.white, // Ensure the text is visible
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),),
          ),
        );
      },
    );
  }
}
