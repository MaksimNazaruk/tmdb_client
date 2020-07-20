import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb_client/services/common/parsers/parser.dart';
import 'package:tmdb_client/services/common/web_request.dart';

abstract class WebService<T> {
  String get baseUrl;

  Future<T> fetchData(WebRequest request, Parser<T> parser) async {
    dynamic jsonResponse = await performRequest(request);
    return parser.fromJson(jsonResponse);
  }

  Future<dynamic> performRequest(WebRequest request) async {
    http.Response response = await _createResponse(request);
    if (_isResponseValid(response)) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Response from ${response.request.url.toString()} failed with status code ${response.statusCode}');
    }
  }

  bool _isResponseValid(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Future<http.Response> _createResponse(WebRequest request) {
    String url = request.fullUrl(baseUrl);
    switch (request.type) {
      case WebRequestType.GET:
        return http.get(url, headers: request.headers);
        break;
      case WebRequestType.POST:
        return http.post(url, headers: request.headers, body: request.body);
        break;
      case WebRequestType.PUT:
        return http.put(url, headers: request.headers, body: request.body);
        break;
      case WebRequestType.DELETE:
        return http.delete(url, headers: request.headers);
        break;
      default:
        return null;
    }
  }
}
