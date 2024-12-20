import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/card_rotation.dart';

class PulsatingContainer extends StatefulWidget {
  const PulsatingContainer({super.key});

  @override
  State<PulsatingContainer> createState() => _PulsatingContainerState();
}

class _PulsatingContainerState extends State<PulsatingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );

    _sizeAnimation = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceInOut,
      ),
    );

    _animationController.repeat(reverse: true);
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
        animation: _sizeAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animationController.value,
            alignment: Alignment.center,
            child: const MyCard(),
          );
        },
      ),
    );
  }
}
