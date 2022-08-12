import 'serverinfo.dart';

class Server {
  final String status;
  final ServerInfo information;
  final List links;
  final String id;
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