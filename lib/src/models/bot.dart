import 'package:boticord/src/models/botinfo.dart';
import 'package:boticord/src/models/botserver.dart';

/// Model represents a bot.
class Bot {
  /// Bot's Id.
  final String id;

  /// Information about the bot.
  final BotInfo information;

  /// Bot's links;
  final List links;

  /// Bot's page short code.
  final String? shortCode;

  /// Server, that attached to the bot.
  final BotServer? server;

  Bot({
    required this.information,
    required this.id,
    required this.links,
    this.shortCode,
    this.server
  });

  Bot.parseJson(
      Map<String, dynamic> json
  ):
    id = json['id'],
    shortCode = json['shortCode'],
    links = json['links'],
    information = BotInfo.parseJson(json['information']),
    server = BotServer.parseJson(json['server']);
}