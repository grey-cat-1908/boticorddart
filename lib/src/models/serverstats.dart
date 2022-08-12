class ServerStats {
  final String serverID;
  final int up;
  final bool updated;
  final int bumps;
  final bool? boost;
  final bool? upSuccessfully;
  final int? timeToNextUpInMs;
  final String? message;

  ServerStats({
    required this.serverID,
    required this.up,
    required this.updated,
    required this.bumps,
    this.boost,
    this.upSuccessfully,
    this.timeToNextUpInMs,
    this.message
  });

  Map<String, dynamic> toJson() {
    return {
      'serverID': serverID,
      'up': up,
      'updated': updated,
      'bumps': bumps,
      if (boost != null) 'boost': boost,
      if (upSuccessfully != null) 'upSuccessfully': upSuccessfully,
      if (timeToNextUpInMs != null) 'timeToNextUpInMs': timeToNextUpInMs,
      if (message != null) 'message': message,
    };
  }
}