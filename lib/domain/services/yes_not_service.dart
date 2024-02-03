import 'package:dio/dio.dart';
import 'package:maybe_app/domain/models/message.dart';
import 'package:maybe_app/domain/models/yes_not_answer.dart';

class YesNotService{
  final dio = Dio();
  final String yesNotPath = 'https://yesno.wtf/api';

  Future<Message> getAnswer() async {
    final response = await dio.get(yesNotPath);
    final YesNotAnswer yesNotAnswer = YesNotAnswer.fromJsonMap(response.data);

    return Message(
      text: yesNotAnswer.answer,
      urlImage: yesNotAnswer.image, 
      fromWho: FromWho.other
    );
    
  }
}