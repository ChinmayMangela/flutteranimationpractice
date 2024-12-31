import 'dart:math';
import 'dart:ui';

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
  late AnimationController _colorAnimationController;
  late List<AnimationController> _starAnimationControllers;
  late Animation<double> _blinkAnimation;
  late Animation<Offset> _slidingTextAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Color?> _textColorAnimation;
  final int _starsCount = 30;
  final _random = Random();

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.cyan,
    Colors.teal,
    Colors.indigo,
    Colors.brown,
    Colors.pink,
    Colors.grey,
    Colors.amber,
    Colors.lime,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.blueGrey,
  ];

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

    _colorAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3400),
    )..repeat();

    //animation responsible for text-color
    _textColorAnimation = TweenSequence<Color?>(
      List.generate(
        colors.length - 1,
        (index) {
          return TweenSequenceItem<Color?>(
              tween: ColorTween(begin: colors[index], end: colors[index + 1]),
              weight: 1.0);
        },
      ),
    ).animate(
      CurvedAnimation(
        parent: _colorAnimationController,
        curve: Curves.linearToEaseOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    for (AnimationController controller in _starAnimationControllers) {
      controller.dispose();
    }
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
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.7, sigmaY: 1.7),
          child: Container(color: Colors.transparent),
        ),
        TextAnimation(
          animationController: _animationController,
          textAnimation: _slidingTextAnimation,
          opacityAnimation: _opacityAnimation,
          textColorAnimation: _textColorAnimation,
          colorAnimationController: _colorAnimationController,
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
