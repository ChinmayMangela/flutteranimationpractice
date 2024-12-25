import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/trasform_scale_example.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/upside_down_heart_falling_effects.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TransformScaleExample()
    );
  }
}
