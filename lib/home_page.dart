import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );

    _sizeAnimation = Tween<double>(begin: 0, end: 200).animate(_animationController);

    _animationController.repeat(
      reverse: true
    );
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
        child: AnimatedBuilder(animation: _sizeAnimation, builder: (context, child) {
          return MyCircle(size: _sizeAnimation.value);
        }),
      ),
    );
  }
}

class MyCircle extends StatelessWidget {
  const MyCircle({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            blurRadius: size,
            spreadRadius: size,
          ),
        ],
      ),
    );
  }
}
