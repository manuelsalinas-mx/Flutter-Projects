import 'package:flutter/material.dart';
import 'package:forms_app/config/router/app_router.dart';
import 'package:forms_app/config/theme/app_theme.dart';

// Traditional forms: https://github.com/Klerith/flutter-formularios/tree/fin-seccion-19-tradicional
// Cubit forms: https://github.com/Klerith/flutter-formularios/tree/fin-seccion-19-cubit
// Formz forms: https://github.com/Klerith/flutter-formularios/tree/fin-seccion-19-formz


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
