import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/animated_square.dart';

class TransformScaleExample extends StatefulWidget {
  const TransformScaleExample({super.key});

  @override
  State<TransformScaleExample> createState() =>
      _TransformScaleExampleState();
}

class _TransformScaleExampleState
    extends State<TransformScaleExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2700,
      ),
    );

    _animation =
        Tween<double>(begin: 1, end: 10).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            alignment: Alignment.centerLeft,
            scale: _animation.value, //  example scale: 2.0,  // Scale factor (2.0 means 200% of the original size)
            child: const MyContainer(color: Colors.red),
          );
        },
      ),
    );
  }
}
