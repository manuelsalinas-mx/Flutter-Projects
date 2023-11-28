import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('https://pbs.twimg.com/media/Ec9kAEUXgAAcYwA.jpg'),
          ),
        ),
        title: const Text('❤️ Viry Ferguson ❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {

              return (index % 2 == 0)
              ? const HerMessageBubble()
               : const MyMessageBubble();
            })),
           
           const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
