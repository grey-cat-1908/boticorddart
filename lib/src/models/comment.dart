/// This model represents single comment.
class Comment {
  /// Comment author's id.
  final String userID;

  /// Comment content.
  final String text;

  /// Comment vote.
  final int vote;

  /// Was comment updated?
  final bool isUpdated;

  /// Comment creation timestamp.
  final DateTime? createdAt;

  /// Last comment edit timestamp.
  final DateTime? updatedAt;

  Comment({
    required this.userID,
    required this.text,
    required this.vote,
    required this.isUpdated,
    this.createdAt,
    this.updatedAt
  });

  Comment.parseJson(
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