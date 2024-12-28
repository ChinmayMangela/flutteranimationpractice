import 'package:flutter/material.dart';

class ColorChangingText extends StatefulWidget {
  const ColorChangingText({super.key});

  @override
  State<ColorChangingText> createState() => _ColorChangingTextState();
}

class _ColorChangingTextState extends State<ColorChangingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 9500,
      ),
    )..repeat();

    _colorAnimation = TweenSequence<Color?>(
      List.generate(
        _colors.length - 1,
        (index) {
          return TweenSequenceItem<Color?>(
              tween: ColorTween(begin: _colors[index], end: _colors[index + 1]),
              weight: 1.0);
        },
      ),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linearToEaseOut,
      ),
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
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Text(
              'CHINMAY',
              style: TextStyle(
                color: _colorAnimation.value,
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            );
          }),
    );
  }
}

List<Color> _colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.cyan,
  Colors.teal,
  Colors.indigo,
  Colors.brown,
  Colors.pink,
  Colors.grey,
  Colors.amber,
  Colors.lime,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.blueGrey,
];
