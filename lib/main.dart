import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/animated_color_palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedColorPalette(),
    );
  }
}
