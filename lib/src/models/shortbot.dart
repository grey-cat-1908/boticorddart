class ShortBot {
  final String id;
  final String? shortCode;

  ShortBot({
    required this.id,
    this.shortCode
  });

  ShortBot.parseJson(
      Map<String, dynamic> json
  ):
    id = json['id'],
    shortCode = json['shortCode'];
}