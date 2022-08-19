import 'package:boticord/src/models/botstats.dart';
import 'package:boticord/src/models/links.dart';

/// This model represents Information about the bot.
class BotInfo {
  /// Bumps Count,
  final int bumps;

  /// How many times users have added the bot?
  final int added;

  /// Bot's prefix.
  final String? prefix;

  /// Bot's (required) permissions.
  final int permissions;

  /// Bot's search-tags.
  final List<String?>? tags;

  /// Bot's developers list.
  final List<String?>? developers;

  /// Bot's social medias.
  final Links? links;

  /// Library bot is based on.
  final String? library;

  /// Bot's short description.
  final String? shortDescription;

  /// Bot's long description.
  final String? longDescription;

  /// Bot's badge.
  final String? badge;

  /// Bot's stats.
  final BotStats? stats;

  /// Bot's approval status.
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
    links = Links.parseJson(json['links']),
    library = json['library'],
    shortDescription = json['shortDescription'],
    longDescription = json['longDescription'],
    badge = json['badge'],
    stats = BotStats.parseJson(json['stats']),
    status = json['status'];
}