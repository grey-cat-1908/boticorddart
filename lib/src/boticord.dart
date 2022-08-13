import 'package:boticord/src/models/bot.dart';
import 'package:boticord/src/models/comment.dart';
import 'package:boticord/src/models/botstats.dart';
import 'package:boticord/src/models/shortbot.dart';
import 'package:boticord/src/models/shortedllnk.dart';
import 'package:boticord/src/models/usercomments.dart';
import 'package:boticord/src/models/serverstats.dart';
import 'package:boticord/src/models/profile.dart';

import 'models/server.dart';
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

  Future<Server> getServerInfo(String serverId) async {
    return Server.parseJson(
      await _rest?.request(
        'GET',
        '/server/$serverId',
      ),
    );
  }

  Future<Profile> getUserInfo(String userId) async {
    return Profile.parseJson(
      await _rest?.request(
        'GET',
        '/profile/$userId',
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

  Future postServerStats(ServerStats stats) async {
    await _rest?.request(
        'POST',
        '/server',
        body: stats.toJson()
    );
  }

  Future<List<Comment>> getBotComments(String botId) async {
    final comments = await _rest?.request(
        'GET',
        '/bot/$botId/comments'
    );

    return [
      for (final comment in comments) Comment.parseJson(comment)
    ];
  }

  Future<List<Comment>> getServerComments(String serverId) async {
    final comments = await _rest?.request(
        'GET',
        '/server/$serverId/comments'
    );

    return [
      for (final comment in comments) Comment.parseJson(comment)
    ];
  }

  Future<UserComments> getUserComments(String userId) async {
    return UserComments.parseJson(
      await _rest?.request(
        'GET',
        '/profile/$userId/comments',
      ),
    );
  }

  Future<List<ShortBot>> getUserBots(String userId) async {
    final bots = await _rest?.request(
        'GET',
        '/bots/$userId'
    );

    return [
      for (final bot in bots) ShortBot.parseJson(bot)
    ];
  }

  Future<List<ShortedLink>> getMyShortedLinks() async {
    final links = await _rest?.request(
        'POST',
        '/links/get'
    );

    return [
      for (final link in links) ShortedLink.parseJson(link)
    ];
  }

  Future<List<ShortedLink>> searchMyShortedLinks(String code) async {
    final links = await _rest?.request(
        'POST',
        '/links/get',
        body: {
          'code': code
        }
    );

    return [
      for (final link in links) ShortedLink.parseJson(link)
    ];
  }

  Future createShortedLink(
      String code,
      String link,
      {
        int domain = 1
      }
  ) async {
    await _rest?.request(
        'POST',
        '/link/create',
        body: {
          'code': code,
          'link': link,
          'domain': domain
        }
    );
  }

  Future deleteShortedLink(
      String code,
      {
        int? domain
      }
      ) async {
    Map<String, dynamic> body = {
      'code': code,
    };

    if (domain != null) {
      body['domain'] = domain;
    }

    await _rest?.request(
        'POST',
        '/link/delete',
        body: body
    );
  }
}
