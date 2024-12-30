import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/new_year_animation/animated_star.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/new_year_animation/text_animation.dart';

class BlinkingAnimation extends StatefulWidget {
  const BlinkingAnimation({super.key});

  @override
  State<BlinkingAnimation> createState() => _BlinkingAnimationState();
}

class _BlinkingAnimationState extends State<BlinkingAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<AnimationController> _starAnimationControllers;
  late Animation<double> _blinkAnimation;
  late Animation<Offset> _slidingTextAnimation;
  late Animation<double> _opacityAnimation;
  final int _starsCount = 30;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    // controller for controlling text animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    )..forward();

    // controllers for controlling stars animation
    _starAnimationControllers = List.generate(_starsCount, (index) {
      return AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: _random.nextInt(1500) + 2500,
        ),
      )..repeat(reverse: true);
    });



    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildBackgroundContainer(),
        ...List.generate(_starsCount, (index) {
          _blinkAnimation = Tween<double>(
            begin: 1.0,
            end: 2.5,
          ).animate(
            _starAnimationControllers[index],
          );
          _slidingTextAnimation = Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset(0, MediaQuery.of(context).size.height / 2),
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          );
          final position = Offset(
            _random.nextDouble() * MediaQuery.of(context).size.width,
            _random.nextDouble() * MediaQuery.of(context).size.height,
          );
          final randomSize = _random.nextInt(5) + 10;
          return AnimatedStar(
            animationController: _starAnimationControllers[index],
            blinkingAnimation: _blinkAnimation,
            position: position,
            size: randomSize.toDouble(),
          );
        }),
        TextAnimation(
          animationController: _animationController,
          textAnimation: _slidingTextAnimation,
          opacityAnimation: _opacityAnimation,
        ),
      ],
    );
  }

  Widget _buildBackgroundContainer() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 11, 26),
            Colors.black,
          ],
        ),
      ),
    );
  }
}
