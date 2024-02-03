import 'package:flutter/material.dart';
import 'package:maybe_app/domain/models/message.dart';
import 'package:maybe_app/presentation/providers/chat_provider.dart';
import 'package:maybe_app/presentation/widgets/her_bubble_chat.dart';
import 'package:maybe_app/presentation/widgets/message_field_box.dart';
import 'package:maybe_app/presentation/widgets/my_bubble_chat.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mia Doctora'),
        leading: const Padding( 
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/601916716571058176/LEHlLQ_o_400x400.jpg'),
          )
        ),
        centerTitle: false,
      ),
      body: _ChatView(),
    )
    ;
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final ChatProvider chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
         children: [
            Expanded( 
              /* child: Container(
                color: Colors.red,
              ) */
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.listMessage.length,
                itemBuilder: (context, index){
                  final Message message = chatProvider.listMessage[index];
                  return message.fromWho == FromWho.me
                  ? MyBubbleChat( message: message)
                  : HerBubbleChat(message: message);
                }
              ), 
            ),
            //Esto tiene toda la pinta de un event emmiter
            //Tambien tiene su forma rápida si y solo si tiene los mismos valores posicionales
            //MesaggeFieldBox( onValueChange: (value) => chatProvider.sendMessage(value))
            MesaggeFieldBox( onValueChange: chatProvider.sendMessage)
          ]
        )
      ) 
    );
  }
}