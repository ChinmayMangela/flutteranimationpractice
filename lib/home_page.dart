import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  bool addedToCart = false;

  void _changeCartState() {
    setState(() {
      addedToCart = !addedToCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _changeCartState,
          child: AnimatedContainer(
            alignment: Alignment.center,
            height: 40,
            width: addedToCart ? 150 : 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: addedToCart ? Colors.green : Colors.blue
            ),
            duration: const Duration(seconds: 2),
            child: addedToCart ? const Text('Added to chart') : const Icon(Icons.shopping_cart)
          ),
        ),
      ),
    );
  }
}
