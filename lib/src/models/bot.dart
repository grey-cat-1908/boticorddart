import 'botinfo.dart';

class Bot {
  final BotInfo information;
  final String? id;
  final String? shortCode;
  final List? links;

  Bot({
    required this.information,
    this.id,
    this.shortCode,
    this.links,
  });

  Bot.parseJson(
      Map<String, dynamic> json
  ):
    id = json['id'],
    shortCode = json['shortCode'],
    links = json['links'],
    information = BotInfo.parseJson(json['information']);
}