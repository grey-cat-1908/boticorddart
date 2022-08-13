class ShortedLink {
  final int id;
  final String code;
  final String link;
  final String? ownerID;
  final String? domain;
  final int? views;
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