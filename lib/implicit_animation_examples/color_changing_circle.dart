import 'package:flutter/material.dart';

class ColorChangingCircle extends StatefulWidget {
  const ColorChangingCircle({super.key});

  @override
  State<ColorChangingCircle> createState() => _ColorChangingCircleState();
}

class _ColorChangingCircleState extends State<ColorChangingCircle>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 2500,),)..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: _colors[0],
      end: _colors[_colors.length - 1],
    ).animate(_animationController);

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
        child: AnimatedBuilder(animation: _colorAnimation, builder: (context, child) {
          return MyCircle(color: _colorAnimation.value ?? Colors.red);
        })
    );
  }

}

class MyCircle extends StatelessWidget {
  const MyCircle({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 200,
            spreadRadius: 100,
          ),
        ],
      ),
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
