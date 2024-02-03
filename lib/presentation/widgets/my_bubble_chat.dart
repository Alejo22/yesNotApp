import 'package:flutter/material.dart';
import 'package:maybe_app/domain/models/message.dart';


class MyBubbleChat extends StatelessWidget {

  final Message message;

  const MyBubbleChat({super.key, required this.message });

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(20),
            color: color.primary
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text( message.text , style: const TextStyle( color: Colors.white)),
          )
        ),
        const SizedBox(height: 10)
        ]
    );
  }
}