import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/new_year_animation/second_animation/gradient_background.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/new_year_animation/second_animation/message.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> with TickerProviderStateMixin {
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late Animation<Offset> _fourAnimation;
  late Animation<Offset> _fiveAnimation;
  bool _isFiveVisible = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {

    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _fourAnimation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -500))
        .animate(_animationController1);


    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    _fiveAnimation = Tween<Offset>(begin: const Offset(0, 500), end: const Offset(0, 0))
        .animate(CurvedAnimation(
      parent: _animationController2,
      curve: Curves.easeOut,
    ));

    _animationController1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // After the first animation completes, start the second animation
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _isFiveVisible = true;
          });
          _animationController2.forward(); // Start the second animation (for "4")
        });
      }
    });

    _animationController1.forward(); // Start the first animation (for "5")
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientBackground(),
          Center(
            child: Message(
              animationController1: _animationController1,
              animationController2: _animationController2,
              fourAnimation: _fourAnimation,
              fiveAnimation: _fiveAnimation,
              isFiveVisible: _isFiveVisible,
            ),
          ),
        ],
      ),
    );
  }
}
