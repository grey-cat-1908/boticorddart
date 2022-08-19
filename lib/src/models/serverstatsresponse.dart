/// This model represents postServerStats() method response.
class ServerStatsResponse {
  /// Server Id
  final String serverID;

  /// Is this bump request? (`1` - yes, `0` - no)
  final int up;

  /// Is server updated successfully?
  final bool updated;

  /// Total server bumps count.
  final int bumps;

  /// Is server boosted?
  final bool? boost;

  /// Is server bumped successfully?
  final bool? upSuccessfully;

  /// When server can be bumped next time.
  final int? timeToNextUpInMs;

  /// Message to show for the user.
  final String? message;

  ServerStatsResponse({
    required this.serverID,
    required this.up,
    required this.updated,
    required this.bumps,
    this.boost,
    this.upSuccessfully,
    this.timeToNextUpInMs,
    this.message
  });

  ServerStatsResponse.parseJson(
      Map<String, dynamic> json
      ):
        serverID = json['serverID'],
        up = json['up'],
        updated = json['updated'],
        bumps = json['bumps'],
        boost = json['boost'],
        upSuccessfully = json['upSuccessfully'],
        timeToNextUpInMs = json['timeToNextUpInMs'],
        message = json['message'];
}