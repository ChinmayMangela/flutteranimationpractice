import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/new_year_animation/second_animation/gradient_background.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/new_year_animation/second_animation/message.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _fourAnimationController;
  late AnimationController _fiveAnimationController;
  late AnimationController _zoomAnimationController;
  late Animation<Offset> _fourAnimation;
  late Animation<Offset> _fiveAnimation;
  late Animation<double> _zoomAnimation;
  bool _isFiveVisible = false;
  bool _isDigitsFloatingAnimationCompleted = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    // controller responsible for controlling animation of 4
    _fourAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );

    // this animation object is responsible for floating animation of 4
    _fourAnimation = Tween<Offset>(
      begin: const Offset(0, 0), // starts from initial position
      end: const Offset(0, -500), // goes to the top of the screen
    ).animate(
      CurvedAnimation(
        parent: _fourAnimationController,
        curve: Curves.linear,
      ),
    );

    // controller responsible for controlling animation of 5
    _fiveAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );

    // this animation object is responsible for floating animation of 4
    _fiveAnimation = Tween<Offset>(
      begin: const Offset(0, 500), // comes from bottom of the screen
      end: const Offset(0, 0), // ends at the initial position i.e at the center
    ).animate(
      CurvedAnimation(
        parent: _fiveAnimationController,
        curve: Curves.linear,
      ),
    );

    _zoomAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2000,
      ),
    );

    _zoomAnimation = Tween<double>(
      begin: 0,
      end: 1.5,
    ).animate(
      CurvedAnimation(
        parent: _zoomAnimationController,
        curve: Curves.bounceIn,
      ),
    );

    _setupAnimationTriggers();

    _fourAnimationController.forward();
  }

  void _setupAnimationTriggers() {
    // trigger 5's animation after 4 completes
    _fourAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _isFiveVisible = true;
          });
          _fiveAnimationController
              .forward(); // starts animation of 5 after 500 ms when animation of 4 is completed
        });
      }
    });

    // trigger zoom animation after 5 completes
    _fiveAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 200), () {
          setState(() {
            _isDigitsFloatingAnimationCompleted = true;
          });
          _zoomAnimationController.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _fourAnimationController.dispose();
    _fiveAnimationController.dispose();
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
        const GradientBackground(),
        Center(
          child: Message(
            fourAnimation: _fourAnimation,
            fiveAnimation: _fiveAnimation,
            zoomAnimation: _zoomAnimation,
            isFiveVisible: _isFiveVisible,
            animationController1: _fourAnimationController,
            animationController2: _fiveAnimationController,
            zoomAnimationController: _zoomAnimationController,
            isDigitsAnimationCompleted: _isDigitsFloatingAnimationCompleted,
          ),
        ),
      ],
    );
  }
}
