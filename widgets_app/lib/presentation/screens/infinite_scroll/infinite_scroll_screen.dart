import 'package:flutter/material.dart';

class InfiniteScrollScreen extends StatelessWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});
  

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scroll Screen'),
      ),
      body: const Placeholder(),
    );
  }
}
