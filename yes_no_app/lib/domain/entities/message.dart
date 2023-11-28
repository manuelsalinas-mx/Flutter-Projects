
class Message {
  final String text;
  final String? imageUrl;
  final FromWho from;

  Message({
    required this.text, 
    this.imageUrl, 
    required this.from
    });
}

enum FromWho { me, hers }
