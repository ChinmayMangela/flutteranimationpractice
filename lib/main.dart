import 'package:flutter/material.dart';
import 'package:flutteranimationpractice/implicit_animation_examples/pulsating_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PulsatingContainer()
    );
  }
}
