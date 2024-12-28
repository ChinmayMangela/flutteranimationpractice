import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/floating_heart/animated_heart.dart';

class FloatingHeartAnimation2 extends StatefulWidget {
  const FloatingHeartAnimation2({super.key});

  @override
  State<FloatingHeartAnimation2> createState() =>
      _FloatingHeartAnimation2State();
}

class _FloatingHeartAnimation2State extends State<FloatingHeartAnimation2>
    with TickerProviderStateMixin {
  final _random = Random();
  late List<AnimationController> _animationControllers;

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(10, (index) {
      final controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: _random.nextInt(1500) + 2500),
      )..repeat();
      return controller;
    });
  }

  @override
  void dispose() {
    for (final controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: List.generate(10, (index) {
          final randomTopOffset = _random.nextDouble() * screenWidth;
          final floatingAnimation = Tween<Offset>(
            begin: Offset(screenWidth / 2, screenHeight),
            end: Offset(randomTopOffset, -100),
          ).animate(
            CurvedAnimation(
              parent: _animationControllers[index],
              curve: Curves.linear,
            ),
          );

          return AnimatedHeart(
            animationController: _animationControllers[index],
            floatingAnimation: floatingAnimation,
          );
        }),
      ),
    );
  }
}
