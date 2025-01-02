import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.fourAnimation,
    required this.fiveAnimation,
    required this.isFiveVisible,
    required this.animationController1,
    required this.animationController2,
    required this.isDigitsAnimationCompleted,
    required this.zoomAnimationController,
    required this.zoomAnimation,
  });

  final AnimationController animationController1;
  final AnimationController animationController2;
  final AnimationController zoomAnimationController;
  final Animation<Offset> fourAnimation;
  final Animation<Offset> fiveAnimation;
  final Animation<double> zoomAnimation;
  final bool isFiveVisible;
  final bool isDigitsAnimationCompleted;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: zoomAnimationController,
        builder: (context, child) {
          return Transform.scale(
            scale: isDigitsAnimationCompleted ? zoomAnimation.value : 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isDigitsAnimationCompleted) _buildNewYearText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStaticText('202'),
                    // Show the number 5 while it's animating out, then 4 animating in
                    if (!isFiveVisible)
                      _buildAnimation(fourAnimation, '4', animationController1),
                    if (isFiveVisible)
                      _buildAnimation(fiveAnimation, '5', animationController2),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget _buildAnimation(Animation<Offset> animation, String digit,
      AnimationController animationController) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: animation.value,
          child: Text(
            digit,
            style: const TextStyle(
              fontSize: 100,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }

  Widget _buildNewYearText() {
    return Text(
      'Happy New Year',
      style: GoogleFonts.dancingScript(
        fontSize: 55,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildStaticText(String text) {
    return Text(
      text,
      style: _textStyle,
    );
  }

  TextStyle get _textStyle => const TextStyle(
        fontSize: 100,
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      );
}
