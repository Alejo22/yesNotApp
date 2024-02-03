
enum FromWho { me, other }

class Message{
  final String text;
  final FromWho fromWho;
  final String? urlImage;

  Message( {
    required this.text,
    this.urlImage,
    required this.fromWho
  });
}