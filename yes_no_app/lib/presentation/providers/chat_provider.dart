import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hola!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    // is a question?
    if (text.endsWith('?')) {
      getHerReply();
    }

  // Notify & scroll
    notifyListeners();
    scrollToBottom();
  }

  Future<void> getHerReply() async {
    final reply = await getYesNoAnswer.getAnswer();
    messages.add(reply);

     // Notify & scroll
    notifyListeners();
    scrollToBottom();
  }

  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
