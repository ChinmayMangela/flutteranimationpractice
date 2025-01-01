import 'package:flutter/material.dart';

class AnimatedStar extends StatelessWidget {
  const AnimatedStar({
    super.key,
    required this.animationController,
    required this.blinkingAnimation,
    required this.position,
    required this.size,

  });

  final AnimationController animationController;
  final Animation<double> blinkingAnimation;
  final Offset position;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: blinkingAnimation.value,
            child: Icon(
              Icons.star_outlined,
              color: Colors.white,
              size: size,
            ),
          );
        },
      ),
    );
  }
}
