import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/config.dart';

// Repo https://github.com/Klerith/flutter-teslo-app/tree/main

void main() async {
  // * Cargar variables de entorno
  await Environment.initEnvironment();

  // * ProviderScope nos da acceso a todos los providers
  runApp(const ProviderScope(child: MainApp()));
}

// * Antes -> class MainApp extends StatelessWidget {
class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  // * Antes -> Widget build(BuildContext context) {
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
