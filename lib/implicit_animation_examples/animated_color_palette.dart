import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedColorPalette extends StatefulWidget {
  const AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  List<Color> _colorPalette = _getColorPalette();

  void _generateNewColors() {
    setState(() {
      _colorPalette = _getColorPalette();
    });
  }

  static List<Color> _getColorPalette() {
    final random = Random();
    return List<Color>.generate(5, (context) {
      return Color.fromARGB(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (Color color in _colorPalette)
            ColorBox(
              color: color,
            ),
          const SizedBox(height: 10),
          _buildButton()
        ],
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: _generateNewColors,
      child: const Text('Generate'),
    );
  }
}

class ColorBox extends StatelessWidget {
  const ColorBox({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    );
  }
}
