import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('BloC Counter'),
         actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: const Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('x',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.w700)),
          Text('Counter Value'),
        ],
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              elevation: 1.5,
              child: const Text('+3'),
              onPressed: () {}),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2',
              elevation: 1.5,
              child: const Text('+2'),
              onPressed: () {}),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3',
              elevation: 1.5,
              child: const Text('+1'),
              onPressed: () {}),
        ],
      ),
    );
  }
}
