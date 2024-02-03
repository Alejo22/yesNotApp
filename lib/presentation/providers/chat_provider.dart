import 'package:flutter/material.dart';
import 'package:maybe_app/domain/models/message.dart';
import 'package:maybe_app/domain/services/yes_not_service.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController scrollController = ScrollController();
  final YesNotService yesNotService = YesNotService();

  List<Message> listMessage = [];

  Future<void> sendMessage(String messageText) async {

    if(messageText.isEmpty) return;

    final message = Message(text: messageText, fromWho: FromWho.me);
    listMessage.add(message);
    
    notifyListeners();
    moveScrolltoBottom();

    if( messageText.endsWith('?')){
      herReply();
    }
  }


  Future<void> herReply() async{
    //final message = Message(text: "Bien cielo, aquí en el trabajo", urlImage: 'https://yesno.wtf/assets/yes/11-a23cbde4ae018bbda812d2d8b2b8fc6c.gif', fromWho: FromWho.other);
    final Message message = await yesNotService.getAnswer();
    listMessage.add(message);
    notifyListeners();
    moveScrolltoBottom();
  }

  void moveScrolltoBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration( milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
}