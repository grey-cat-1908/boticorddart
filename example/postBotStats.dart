import 'package:boticord/boticord.dart';
import 'package:boticord/src/models/bot.dart';
import 'package:boticord/src/models/botstats.dart';

void main() async {
  final client = BotiCord(
    token: '',
  );

  final BotStats stats = BotStats(
    servers: 150,
    users: null,
    shards: 1
  );

  await client.postBotStats(stats);
}
