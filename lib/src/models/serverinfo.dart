import 'package:boticord/src/models/links.dart';

class ServerInfo {
  final String name;
  final String? avatar;
  final List<int?> members;
  final String? owner;
  final int bumps;
  final List<String>  tags;
  final Links links;
  final String? shortDescription;
  final String? longDescription;
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