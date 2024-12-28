import 'package:flutter/material.dart';

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10500),
    );


    _sizeAnimation = Tween<double>(begin: 1, end: 2.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceInOut,
      ),
    );


    _colorAnimation = TweenSequence<Color?>(
      List.generate(
        _colors.length - 1,
            (index) => TweenSequenceItem<Color?>(
          tween: ColorTween(begin: _colors[index], end: _colors[index + 1]),
          weight: 1.0,
        ),
      ),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    _animationController.repeat(reverse: true);
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
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _sizeAnimation.value,
            child: MyContainer(
              color: _colorAnimation.value!,
            ),
          );
        },
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color color;

  const MyContainer({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 100,
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
