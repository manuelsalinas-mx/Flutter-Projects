import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestores de Estado',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple',
                style: TextStyle(fontWeight: FontWeight.w300)),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            leading: const Icon(Icons.edit_square),
            onTap: () {
              context.push('/cubits');
            },
          ),
          ListTile(
            title: const Text('BloC'),
            subtitle: const Text('Gestor de estado compuesto',
                style: TextStyle(fontWeight: FontWeight.w300)),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            leading: const Icon(Icons.business_sharp),
            onTap: () {
              context.push('/bloc');
            },
          ),
        ],
      ),
    );
  }
}
