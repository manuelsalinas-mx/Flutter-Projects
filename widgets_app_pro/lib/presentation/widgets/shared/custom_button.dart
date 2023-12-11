import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  // final IconData icon;
  // final VoidCallback? onPressed;

  const MyCustomButton({
    super.key,
    // required this.icon,
    // this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
