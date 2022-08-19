import 'package:boticord/src/models/bot.dart';
import 'package:boticord/src/models/comment.dart';
import 'package:boticord/src/models/botstats.dart';
import 'package:boticord/src/models/shortbot.dart';
import 'package:boticord/src/models/shortedllnk.dart';
import 'package:boticord/src/models/usercomments.dart';
import 'package:boticord/src/models/serverstats.dart';
import 'package:boticord/src/models/serverstatsresponse.dart';
import 'package:boticord/src/models/profile.dart';
import 'package:boticord/src/models/server.dart';

import 'package:boticord/src/rest.dart';

/// A wrapper around BotiCord API.
class BotiCord {
  /// BotiCord Token
  ///
  /// In BotiCord API v2 there are some changes with token.
  /// [Read more here](https://docs.boticord.top/topics/v1vsv2/)
  final String? token;

  // BotiCord API version
  int? version;

  final BotiCordRest? _rest;

  /// Create a new instance of [BotiCord] with [token].
  /// Also you can set [version] to use another BotiCord API version.
  /// (default: 1)
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

  /// Get information about a specific bot by it's [botId].
  Future<Bot> getBotInfo(String botId) async {
    return Bot.parseJson(
      await _rest?.request(
        'GET',
        '/bot/$botId',
      ),
    );
  }

  /// Get information about a specific server by it's [serverId].
  Future<Server> getServerInfo(String serverId) async {
    return Server.parseJson(
      await _rest?.request(
        'GET',
        '/server/$serverId',
      ),
    );
  }

  /// Get information about a specific server by it's [userId].
  Future<Profile> getUserInfo(String userId) async {
    return Profile.parseJson(
      await _rest?.request(
        'GET',
        '/profile/$userId',
      ),
    );
  }

  /// Post current bot's [stats] method.
  ///
  /// ```dart
  /// final BotStats stats = BotStats(
  ///     servers: 150,
  ///     users: null,
  ///     shards: 1
  /// );
  ///
  /// await client.postBotStats(stats);
  ///  ```
  Future postBotStats(BotStats stats) async {
    await _rest?.request(
      'POST',
      '/stats',
      body: stats.toJson()
    );
  }

  /// Post current server's [stats] method.
  ///
  /// Remember, that only Boticord-Service Bots can do it in global,
  /// other will get an 403 error.
  /// (but it may works for custom bots, but you need a special API-token)
  ///
  Future<ServerStatsResponse> postServerStats(ServerStats stats) async {
    return ServerStatsResponse.parseJson(
      await _rest?.request(
        'POST',
        '/server',
        body: stats.toJson()
      )
    );
  }

  /// Get List of bot's comments.
  Future<List<Comment>> getBotComments(String botId) async {
    final comments = await _rest?.request(
        'GET',
        '/bot/$botId/comments'
    );

    return [
      for (final comment in comments) Comment.parseJson(comment)
    ];
  }

  /// Get List of server's comments.
  Future<List<Comment>> getServerComments(String serverId) async {
    final comments = await _rest?.request(
        'GET',
        '/server/$serverId/comments'
    );

    return [
      for (final comment in comments) Comment.parseJson(comment)
    ];
  }

  /// Get List of user's comments.
  Future<UserComments> getUserComments(String userId) async {
    return UserComments.parseJson(
      await _rest?.request(
        'GET',
        '/profile/$userId/comments',
      ),
    );
  }

  /// Get List of user's bots.
  Future<List<ShortBot>> getUserBots(String userId) async {
    final bots = await _rest?.request(
        'GET',
        '/bots/$userId'
    );

    return [
      for (final bot in bots) ShortBot.parseJson(bot)
    ];
  }

  /// Get List of shorted by current user links.
  Future<List<ShortedLink>> getMyShortedLinks() async {
    final links = await _rest?.request(
        'POST',
        '/links/get'
    );

    return [
      for (final link in links) ShortedLink.parseJson(link)
    ];
  }

  /// Get List of shorted by current user links (with the provided [code]).
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

  /// Creates new shorted link (with specified parameters).
  Future<ShortedLink> createShortedLink(
      String code,
      String link,
      {
        int domain = 1
      }
  ) async {
    return ShortedLink.parseJson(
        await _rest?.request(
          'POST',
          '/link/create',
          body: {
            'code': code,
            'link': link,
            'domain': domain
          }
        )
    );
  }

  /// Delete shorted link (with specified [code]).
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
