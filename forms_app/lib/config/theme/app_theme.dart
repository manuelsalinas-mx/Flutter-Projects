import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedcolor = Colors.deepPurple;

    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedcolor,
        listTileTheme: const ListTileThemeData(iconColor: seedcolor));
  }
}
