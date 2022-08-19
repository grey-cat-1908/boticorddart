/// This model represents shorted link
class ShortedLink {
  /// Id of shorted link
  final int id;

  /// Code of shorted link
  final String code;

  /// Original Link of shorted link
  final String link;

  /// Id of owner of shorted link
  final String? ownerID;

  /// Domain of shorted link
  final String? domain;

  /// Link views count
  final int? views;

  /// Timestamp of link creation moment
  final DateTime? date;

  ShortedLink({
    required this.id,
    required this.code,
    required this.link,
    this.ownerID,
    this.domain,
    this.views,
    this.date
  });

  ShortedLink.parseJson(
      Map<String, dynamic> json
      ):
      id = json['id'],
      code = json['code'],
      link = json['link'],
      ownerID = json['ownerID'],
      domain = json['domain'],
      views = json['views'],
      date = json['date'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['date']);
}