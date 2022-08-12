class Profile {
  final String id;
  final String? status;
  final String? badge;
  final String? shortCode;
  final String? site;
  final String? youtube;
  final String? twitch;
  final String? steam;
  final String? vk;
  final String? git;

  Profile({
    required this.id,
    this.status,
    this.badge,
    this.shortCode,
    this.site,
    this.youtube,
    this.twitch,
    this.steam,
    this.vk,
    this.git
  });

  Profile.parseJson(
      Map<String, dynamic> json
  ):
    id = json['id'],
    status = json['status'],
    badge = json['badge'],
    shortCode = json['shortCode'],
    git = json['git'],
    site = json['site'],
    youtube = json['youtube'],
    twitch = json['twitch'],
    steam = json['steam'],
    vk = json['vk'];
}