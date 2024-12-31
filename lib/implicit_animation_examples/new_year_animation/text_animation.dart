import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({
    super.key,
    required this.animationController,
    required this.colorAnimationController,
    required this.textAnimation,
    required this.opacityAnimation,
    required this.textColorAnimation,
  });

  final AnimationController animationController;
  final AnimationController colorAnimationController;
  final Animation<Offset> textAnimation;
  final Animation<double> opacityAnimation;
  final Animation<Color?> textColorAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: textAnimation.value,
          child: FadeTransition(
            opacity: opacityAnimation,
            child: AnimatedBuilder(animation: colorAnimationController, builder: (context, child) {
              return Text('HAPPY NEW YEAR 2025',  style: TextStyle(
                color: textColorAnimation.value,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),);
            }),
          ),
        );
      },
    );
  }
}
