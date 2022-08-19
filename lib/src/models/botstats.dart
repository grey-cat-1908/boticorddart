/// This model represents Bot's stats.
class BotStats {
  /// Cached servers count.
  final int? servers;

  /// Cached users count.
  final int? users;

  /// Bot's shards count.
  final int? shards;

  BotStats({
    this.servers,
    this.users,
    this.shards
  });

  BotStats.parseJson(
      Map<String, dynamic> json
  ):
    servers = json['servers'],
    users = json['users'],
    shards = json['shards'];

  Map<String, dynamic> toJson() {
    return {
      if (servers != null) 'servers': servers,
      if (users != null) 'users': users,
      if (shards != null) 'shards': shards
    };
  }
}