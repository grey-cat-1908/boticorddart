import 'botinfo.dart';

class Bot {
  final BotInfo information;
  final String id;
  final List links;
  final String? shortCode;

  Bot({
    required this.information,
    required this.id,
    required this.links,
    this.shortCode,
  });

  Bot.parseJson(
      Map<String, dynamic> json
  ):
    id = json['id'],
    shortCode = json['shortCode'],
    links = json['links'],
    information = BotInfo.parseJson(json['information']);
}