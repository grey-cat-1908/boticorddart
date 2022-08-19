/// This model represents Server stats.
class ServerStats {
  /// Server Id
  final String serverID;

  /// Is this bump request? (`1` - yes, `0` - no)
  final int up;

  /// Is bot in server members list? (`1` - yes, `0` - no)
  final int status;

  /// Server Name
  final String? serverName;

  /// Server Icon
  final String? serverAvatar;

  /// Server Members count (total, cached by the bot)
  final int? serverMembersAllCount;

  /// Online Server Members count (only currently online members count)
  final int? serverMembersOnlineCount;

  /// Server's Owner Id.
  final String? serverOwnerID;

  ServerStats({
      required this.serverID,
      required this.up,
      required this.status,
      this.serverName,
      this.serverAvatar,
      this.serverMembersAllCount,
      this.serverMembersOnlineCount,
      this.serverOwnerID
  });

  Map<String, dynamic> toJson() {
    return {
      'serverID': serverID,
      'up': up,
      'status': status,
      if (serverName != null) 'serverName': serverName,
      if (serverAvatar != null) 'serverAvatar': serverAvatar,
      if (serverMembersAllCount != null) 'serverMembersAllCount': serverMembersAllCount,
      if (serverMembersOnlineCount != null) 'serverMembersOnlineCount': serverMembersOnlineCount,
      if (serverOwnerID != null) 'serverOwnerID': serverOwnerID,
    };
  }
}