import 'package:flutter/material.dart';

class FloatingHeartAnimation extends StatefulWidget {
  const FloatingHeartAnimation({super.key});

  @override
  State<FloatingHeartAnimation> createState() => _FloatingHeartAnimationState();
}

class _FloatingHeartAnimationState extends State<FloatingHeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    _floatingAnimation = Tween<double>(begin: screenHeight, end: -100).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linearToEaseOut,
      ),
    );

    _animationController.repeat();

    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final screenWidth = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(screenWidth / 2, _floatingAnimation.value),
          child: const Heart(),
        );
      },
    );
  }
}

class Heart extends StatelessWidget {
  const Heart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      color: Colors.pink,
      Icons.favorite,
      size: 50,
    );
  }
}
