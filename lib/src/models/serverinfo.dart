import 'package:boticord/src/models/links.dart';

/// This model represents Information about the server.
class ServerInfo {
  /// Server's name.
  final String name;

  /// Server's avatar.
  final String? avatar;

  /// Server's members count
  final List<int?> members;

  /// Server's owner.
  final String? owner;

  /// Bumps count.
  final int bumps;

  /// Server's search-tags.
  final List<String> tags;

  /// Server's social medias.
  final Links links;

  /// Server's short description.
  final String? shortDescription;

  /// Server's long description.
  final String? longDescription;

  /// Server's badge.
  final String? badge;

  ServerInfo({
    required this.name,
    required this.members,
    required this.owner,
    required this.bumps,
    required this.tags,
    required this.links,
    this.avatar,
    this.shortDescription,
    this.longDescription,
    this.badge
  });

  ServerInfo.parseJson(
      Map<String, dynamic> json
  ):
      name = json['name'],
      members = [for (final count in json['members']) count],
      owner = json['owner'],
      bumps = json['bumps'],
      tags = [for (final tag in json['tags']) tag],
      links = Links.parseJson(json['links']),
      avatar = json['avatar'],
      shortDescription = json['shortDescription'],
      longDescription = json['longDescription'],
      badge = json['badge'];
}