import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    // Mantener el foco
    final focusNode = FocusNode();

    // Border for focus and normal
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'Send a message',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          // Mantiene el teclado abierto
          final text = textController.value.text;
          // print('Valor de la caja de texto: $text');
          textController.clear();
          onValue(text);
        },
      ),
    );

    return TextFormField(
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (text) {
        // Cierra automaticamente el teclado
        // print('Submitted vaue: $text');
        textController.clear();

        // Mantener el foco
        focusNode.requestFocus();
         onValue(text);
      },
      // onChanged: (val) {
      //   print('Changed: $val');
      // },
    );
  }
}
