import 'package:flutter/material.dart';

class FullscreenLoader extends StatelessWidget {
  const FullscreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = [
      'Cargando peliculas',
      'Comprando palomitas de maiz',
      'Llamando a mi novia',
      'Como que ya se tardo',
      'Ya mero?',
      'La ultima y nos vamos',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (index) {
      return messages[index];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Espera por favor'),
      const SizedBox(height: 20),
      const CircularProgressIndicator(),
      const SizedBox(height: 20),
      StreamBuilder(
        stream: getLoadingMessages(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return const Text('Cargando...');

          return Text(snapshot.data);
        },
      ),
    ]));
  }
}
