import 'package:flutter/material.dart';
import 'dart:math' show Random;

// Reference: https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  double borderRadius = 10;
  Color color = Colors.blue;

  void changeShape() {
    final random = Random();

    width = random.nextInt(250) + 120;
    height = random.nextInt(250) + 120;
    borderRadius = random.nextInt(100) + 20;
    color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: changeShape, child: const Icon(Icons.play_arrow)),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
    );
  }
}
