class YesNotAnswer{
  final String answer;
  final bool forced;
  final String image;

  YesNotAnswer({required this.answer, required this.forced, required this.image});

  factory YesNotAnswer.fromJsonMap( Map<String, dynamic>  json) =>
    YesNotAnswer(
      answer: json['answer'] == 'yes' ? 'Si' : 'No', 
      forced: json['forced'], 
      image: json['image'],
    );
}