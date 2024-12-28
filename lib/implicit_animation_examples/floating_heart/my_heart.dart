import 'package:flutter/material.dart';

class MyHeart extends StatelessWidget {
  const MyHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      size: 50,
      Icons.favorite,
      color: Colors.pink,
    );
  }
}
