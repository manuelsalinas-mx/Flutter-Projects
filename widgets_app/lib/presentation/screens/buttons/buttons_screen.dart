import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/shared/custom_button.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Styles')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            // Go back
            context.pop();
          }),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();
  
  get label => null;

  @override
  Widget build(BuildContext context) {

   return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.headset_rounded), label: const Text('Elevated icon')),
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.dining_rounded), label: const Text('Filled icon')),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.hub), label: const Text('Outlined icon')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.link), label: const Text('Text icon')),
            IconButton(onPressed: () {}, icon:const Icon(Icons.build_sharp)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.build_sharp), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary), iconColor: const MaterialStatePropertyAll(Colors.white))),

            // Custom button
            const MyCustomButton()
          ],
        ),
      ),
    );
  }
}
