/// This model represents information about user.
class Profile {
  /// Id of the user
  final String id;

  /// Custom status
  final String? status;

  /// User's badge
  final String? badge;

  /// User's Page shortcode
  final String? shortCode;

  /// User's Website
  final String? site;

  /// User's youtube channel
  final String? youtube;

  /// User's twitch account
  final String? twitch;

  /// User's steam profile
  final String? steam;

  /// User's VK page
  final String? vk;

  /// User's github profile
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