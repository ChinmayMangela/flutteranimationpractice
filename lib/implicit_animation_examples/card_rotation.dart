import 'dart:math';

import 'package:flutter/material.dart';

class CardRotation extends StatefulWidget {
  const CardRotation({super.key});

  @override
  State<CardRotation> createState() => _CardRotationState();
}

class _CardRotationState extends State<CardRotation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // initialize animation
    _animation =
        Tween<double>(begin: 0, end: pi * 2).animate(_animationController);

    // repeat the animation
    _animationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(_animation.value),
              child: const MyCard(),
            );
          },
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    const color = Colors.red;
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 200,
                spreadRadius: 100)
          ]),
    );
  }
}
