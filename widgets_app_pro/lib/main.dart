import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Forma 1 (individual)
    // final int selectedColor = ref.watch(selectedColorProvider);
    // final bool isDarkMode = ref.watch(isDarkModeProvider);

    // Forma 2 (compuesto)
    final AppTheme theme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // Forma 1 (individual)
      // theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode).getTheme(),

      // Forma 2 (compuesto)
      theme: theme.getTheme(),
    );
  }
}
