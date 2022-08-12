class BotComment {
  final String userID;
  final String text;
  final int vote;
  final bool isUpdated;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BotComment({
    required this.userID,
    required this.text,
    required this.vote,
    required this.isUpdated,
    this.createdAt,
    this.updatedAt
  });

  BotComment.parseJson(
      Map<String, dynamic> json
  ):
    userID = json['userID'],
    text = json['text'],
    vote = json['vote'],
    isUpdated = json['isUpdated'],
    createdAt = json['createdAt'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
        updatedAt = json['updatedAt'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(json['updatedAt']);
}