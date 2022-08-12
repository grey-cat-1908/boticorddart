import 'comment.dart';

class UserComments {
  final List<Comment>? bots;
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