/// This model represents Bot/Server's social medias.
class Links {
  /// Server's invite link.
  final String? invite;

  /// Bot's github repository.
  final String? github;

  /// Bot's support server.
  final String? discord;

  /// Bot/Server's website.
  final String? site;

  /// Server's youtube channel.
  final String? youtube;

  /// Server's twitch channel.
  final String? twitch;

  /// Server's steam group/profile.
  final String? steam;

  /// Server's VK (Вконтакте) group.
  final String? vk;

  Links({
    this.invite,
    this.github,
    this.discord,
    this.site,
    this.youtube,
    this.twitch,
    this.steam,
    this.vk
  });

  Links.parseJson(
      Map<String, dynamic> json
  ):
    discord = json['discord'],
    github = json['github'],
    invite = json['invite'],
    site = json['site'],
    youtube = json['youtube'],
    twitch = json['twitch'],
    steam = json['steam'],
    vk = json['vk'];
}