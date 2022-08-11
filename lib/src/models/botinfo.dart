import 'package:boticord/src/models/botstats.dart';
import 'package:boticord/src/models/botlinks.dart';

import 'botlinks.dart';

class BotInfo {
  final int bumps;
  final int added;
  final String? prefix;
  final int permissions;
  final List<String?>? tags;
  final List<String?>? developers;
  final BotLinks? links;
  final String? library;
  final String? shortDescription;
  final String? longDescription;
  final String? badge;
  final BotStats? stats;
  final String? status;

  BotInfo({
    required this.bumps,
    required this.added,
    required this.permissions,
    this.prefix,
    this.tags,
    this.developers,
    this.links,
    this.library,
    this.shortDescription,
    this.longDescription,
    this.badge,
    this.stats,
    this.status,
  });

  BotInfo.parseJson(
      Map<String, dynamic> json
  ):
    bumps = json['bumps'],
    added = json['added'],
    permissions = json['permissions'],
    prefix = json['prefix'],
    tags = [for (final tag in json['tags']) tag],
    developers = [for (final dev in json['developers']) dev],
    links = BotLinks.parseJson(json['links']),
    library = json['library'],
    shortDescription = json['shortDescription'],
    longDescription = json['longDescription'],
    badge = json['badge'],
    stats = BotStats.parseJson(json['stats']),
    status = json['status'];
}