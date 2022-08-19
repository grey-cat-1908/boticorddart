import 'package:boticord/src/models/serverinfo.dart';

/// Model represents a server.
class Server {
  /// Server's status.
  final String status;

  /// Information about the server.
  final ServerInfo information;

  /// Bot's links;
  final List links;

  /// Server's Id.
  final String id;

  /// Server's page short code.
  final String? shortCode;

  Server({
    required this.information,
    required this.status,
    required this.id,
    required this.links,
    this.shortCode
  });

  Server.parseJson(
      Map<String, dynamic> json
  ):
    id = json['id'],
    shortCode = json['shortCode'],
    links = json['links'],
    information = ServerInfo.parseJson(json['information']),
    status = json['status'];
}