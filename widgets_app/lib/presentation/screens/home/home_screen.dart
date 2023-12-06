import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets +Material3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final item = appMenuItems[index];
          return _CustomListTile(item: item);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(item.icon, color: colors.primary, size: 45),
      trailing: Icon(Icons.arrow_forward_ios_sharp, color: colors.primary, size: 15),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      onTap: () {
        // Navegar a otra pantalla - Navigator
        /*
          Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ButtonsScreen(),
          ),
        );
        */
        // Navegar a otra pantalla - Rutas (check main.dart)
        //Navigator.pushNamed(context, item.link);

        // Navegar a otra pantalla - GoRouter (el favorito)
        context.push(item.link);
        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}
