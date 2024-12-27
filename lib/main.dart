import 'package:flutter/material.dart';
import 'implicit_animation_examples/floating_heart_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FloatingHeartAnimation()
    );
  }
}
