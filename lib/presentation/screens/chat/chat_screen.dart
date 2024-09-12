import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_devtalles/domain/entities/message.dart';
import 'package:yes_no_app_devtalles/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_devtalles/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_devtalles/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_devtalles/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/611402987257204736/x7n6HDM6_400x400.jpg'),
          ),
        ),
        title: const Text('Mi amor <3'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messages[index];
                      return (message.fromWho == FromWho.me)
                          ? MyMessageBubble(
                              message: message,
                            )
                          : const HerMessageBubble();
                    })),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
