import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/floating_heart/my_heart.dart';

class AnimatedHeart extends StatelessWidget {
  const AnimatedHeart({
    super.key,
    required this.animationController,
    required this.floatingAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> floatingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: floatingAnimation.value,
          child: const MyHeart(),
        );
      },
    );
  }
}
