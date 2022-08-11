import 'dart:convert';
import 'dart:io';

class BotiCordRest {
  final Uri baseUrl;
  final String? token;

  BotiCordRest({required this.baseUrl, this.token});

  Future<dynamic> request(
    String method,
    String path,
    {
      Map<String, dynamic> body = const {},
      Map<String, String> query = const {},
    }
  ) async {
    final client = HttpClient();

    final req = await client.openUrl(
      method,
      Uri(
        scheme: baseUrl.scheme,
        host: baseUrl.host,
        port: baseUrl.port,
        path: baseUrl.path + path,
        queryParameters: query.isEmpty ? null : query,
      ),
    );

    req.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');

    if (body.isNotEmpty) {
      req.add(utf8.encode(jsonEncode(body)));
    }

    final response = await req.close();
    final data = await utf8.decodeStream(response);

    client.close();

    if (!(response.statusCode >= 200 && response.statusCode <= 299)) {
      throw response.statusCode;
    }

    if (data.isNotEmpty) return json.decode(data);
  }
}