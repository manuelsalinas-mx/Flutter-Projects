import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.orange,
  Colors.pink,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.cyan,
  Colors.purple,
  Colors.indigo
];

class AppTheme {
  final int selectedColor;

  AppTheme({
     required this.selectedColor
     }) : assert(selectedColor >= 0 && selectedColor <= colorList.length - 1,
            'Colors must be between 0 and ${colorList.length - 1}');

  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
         colorSchemeSeed: colorList[selectedColor],
         appBarTheme: const AppBarTheme(
          centerTitle: false
         )
    );
  }
}
