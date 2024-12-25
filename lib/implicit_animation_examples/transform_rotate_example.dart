import 'dart:math'; // this library is for accessing pi value

import 'package:flutter/material.dart';

class TransformRotateExample extends StatefulWidget {
  const TransformRotateExample({super.key});

  @override
  State<TransformRotateExample> createState() => _TransformRotateExampleState();
}

class _TransformRotateExampleState extends State<TransformRotateExample> with SingleTickerProviderStateMixin {
  // Declare an AnimationController to control the animation
  late AnimationController _animationController;

  // Declare an Animation to handle the rotation value (angle)
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController with a duration of 2700 milliseconds (2.7 seconds)
    _animationController = AnimationController(
      vsync: this,  // Use this as the ticker provider for animations.
      duration: const Duration(milliseconds: 2700),  // Animation lasts for 2.7 seconds.
    );

    // Define a Tween that starts at 0 (no rotation) and ends at 2*pi (a full 360-degree rotation).
    _animation = Tween<double>(begin: 0, end: pi * 2).animate(_animationController);

    // Start the animation forward (from 0 to 2*pi).
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    // Dispose the animation controller to free up resources when the widget is disposed.
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transform Rotate Animation')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: AnimatedBuilder(
        // Attach the animation to the AnimatedBuilder. It listens to the animation's value.
        animation: _animation,

        // Builder that rebuilds the widget tree whenever the animation value changes.
        builder: (context, child) {
          return Transform.rotate(
            // Specify the alignment for the rotation. In this case, it's rotating around the left center of the widget.
            alignment: Alignment.centerLeft,

            // Pass the current animation value (angle) to the Transform.rotate widget.
            angle: _animation.value,

            child: const MyContainer(color: Colors.red),
          );
        },
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color color;

  const MyContainer({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: color,
    );
  }
}
