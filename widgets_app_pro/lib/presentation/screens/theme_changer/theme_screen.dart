import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  static const String name = 'theme_screen';
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !isDarkMode);
              })
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];

          return RadioListTile(
              title: const Text('Color'),
              subtitle:
                  Text(selectedColor == index ? 'Activado' : 'Seleccionar'),
              tileColor: color,
              activeColor: Colors.white,
              value: index,
              groupValue: selectedColor,
              onChanged: (value) {
                // Notificar cambio
                ref
                    .read(selectedColorProvider.notifier)
                    .update((state) => value ?? 0);
              });
        });
  }
}
