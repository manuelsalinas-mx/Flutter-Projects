import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  // My Functions
  void showCustomSnackbar(BuildContext context) {
    // Limpiar snackbasr anterior
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
        content: const Text('Hola Mundo'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: 'Okay', onPressed: () {}));

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false, // Deshabilita el dismiss al tocar el fondo de la pantalla
      context: context,
     builder: (context) => AlertDialog(
      title: const Text('Estas seguro'),
      content: const Text('Proident aliqua quis qui sint amet cupidatat magna velit non mollit laborum enim ea proident. Nisi occaecat duis Lorem ad laboris ea. Nulla dolor consequat id do aute sit nulla ut amet adipisicing laboris aliqua est occaecat. Ex ipsum voluptate qui id duis sunt elit laborum culpa eu Lorem duis laboris. Veniam sint tempor nulla magna nisi non ad culpa ea non et sit occaecat labore.'),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
        FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
      ],
     )
     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Ullamco quis nisi occaecat ad eu aliquip pariatur cillum deserunt ea consequat cillum qui cillum. Exercitation dolore id magna tempor labore ut ut et consectetur minim ut cillum. Nulla consectetur et nulla aliqua ad esse ullamco. Velit magna veniam fugiat ut ex culpa pariatur culpa aliquip laboris in dolor ut.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () {
                  openDialog(context);
                },
                child: const Text('Mostrar Diálogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.chat_outlined),
        onPressed: () {
          showCustomSnackbar(context);
        },
      ),
    );
  }
}
