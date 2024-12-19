import 'package:flutter/material.dart';

class AnimatedCircle extends StatelessWidget {
  const AnimatedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeTween = Tween<double>(begin: 0, end: 200);
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: sizeTween,
          duration: const Duration(milliseconds: 1500),
          builder: (context, size, child) {
            return MyCircle(size: size);
          },
        ),
      ),
    );
  }
}

class MyCircle extends StatelessWidget {
  const MyCircle({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            blurRadius: size,
            spreadRadius: size / 2,
          ),
        ],
      ),
    );
  }
}
