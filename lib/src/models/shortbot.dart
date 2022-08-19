/// This model represents single bot.
class ShortBot {
  /// Bot's id.
  final String id;

  /// Bot's page shortcode.
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