import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/color_changing_text.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/new_year_animation/blinking_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlinkingAnimation()
    );
  }
}
