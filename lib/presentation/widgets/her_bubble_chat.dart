import 'package:flutter/material.dart';
import 'package:maybe_app/domain/models/message.dart';

class HerBubbleChat extends StatelessWidget {

  final Message message;

  const HerBubbleChat({super.key , required this.message});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration( 
            borderRadius: BorderRadius.circular(20),
            color: color.secondary
          ),
          child:  Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text( message.text, style: const TextStyle( color: Colors.white)),
          )
        ),
        const SizedBox(height: 10),
        if( message.urlImage != null ) _ImageBubble( urlImage: message.urlImage.toString() ),
        const SizedBox(height: 10),
        ]
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final String urlImage;

  const _ImageBubble({required this.urlImage});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        urlImage,
        width: size.width * 0.7,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if( loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Amor está enviando una imagen....')
          );
        },
      )
    );
  }
}