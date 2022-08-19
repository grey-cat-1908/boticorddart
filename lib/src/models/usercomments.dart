import 'package:boticord/src/models/comment.dart';

/// This model represents user's comments
class UserComments {
  /// Comments on bots pages
  final List<Comment>? bots;

  /// Comments on servers pages
  final List<Comment>? servers;

  UserComments({
    this.bots,
    this.servers
  });

  UserComments.parseJson(
      Map<String, dynamic> json
  ):
    bots = [for (final comment in json['bots']) Comment.parseJson(comment)],
    servers = [for (final comment in json['servers']) Comment.parseJson(comment)];
}