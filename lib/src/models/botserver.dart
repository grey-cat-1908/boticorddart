/// This model represents information about the server that attached to the bot.
class BotServer {
  /// Id of the server.
  final int id;

  /// Is server approved?
  final bool approved;

  BotServer({
    required this.id,
    required this.approved,
  });

  BotServer.parseJson(
      Map<String, dynamic> json
      ):
        id = json['id'],
        approved = json['approved'];
}