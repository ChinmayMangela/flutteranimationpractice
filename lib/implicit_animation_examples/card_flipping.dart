import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/card_rotation.dart';

class CardFlipping extends StatefulWidget {
  const CardFlipping({super.key});

  @override
  State<CardFlipping> createState() => _CardFlippingState();
}

class _CardFlippingState extends State<CardFlipping>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );

    _animation = Tween<double>(begin: 0, end: pi * 2).animate(_animationController);

    _animationController.repeat();
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
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateY(_animation.value),
            child: const MyCard(),
          );
        },
      ),
    );
  }
}
