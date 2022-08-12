import 'package:boticord/src/models/bot.dart';
import 'package:boticord/src/models/botcomment.dart';
import 'package:boticord/src/models/botstats.dart';

import 'rest.dart';

class BotiCord {
  final String? token;
  int? version;

  final BotiCordRest? _rest;

  BotiCord({
    required this.token,
    this.version
  }): _rest = BotiCordRest(
      baseUrl:
        Uri.parse(
          'https://api.boticord.top/v${version ?? 1}'
        ),
      token: token
  );

  Future<Bot> getBotInfo(String botId) async {
    return Bot.parseJson(
      await _rest?.request(
        'GET',
        '/bot/$botId',
      ),
    );
  }

  Future postBotStats(BotStats stats) async {
    await _rest?.request(
      'POST',
      '/stats',
      body: stats.toJson()
    );
  }

  Future<List<BotComment>> getBotComments(String botId) async {
    final comments = await _rest?.request(
        'GET',
        '/bot/$botId/comments'
    );

    return [
      for (final comment in comments) BotComment.parseJson(comment)
    ];
  }
}
