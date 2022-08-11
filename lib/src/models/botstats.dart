class BotStats {
  final int? servers;
  final int? users;
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
}