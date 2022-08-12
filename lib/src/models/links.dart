class Links {
  final String? invite;
  final String? site;
  final String? youtube;
  final String? twitch;
  final String? steam;
  final String? vk;

  Links({
    this.invite,
    this.site,
    this.youtube,
    this.twitch,
    this.steam,
    this.vk
  });

  Links.parseJson(
      Map<String, dynamic> json
  ):
    invite = json['invite'],
    site = json['site'],
    youtube = json['youtube'],
    twitch = json['twitch'],
    steam = json['steam'],
    vk = json['vk'];
}