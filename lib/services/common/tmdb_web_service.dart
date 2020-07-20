import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb_client/services/common/parser.dart';
import 'package:tmdb_client/services/common/web_request.dart';

abstract class TmdbWebService<T> {
  // TODO(MN): inject base web service configuration
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String _apiKey = '91a589dc087d7416b8da96aad8844a29';

  Parser<T> get parser;

  Future<T> performRequest(WebRequest request) async {
    var authenticatedRequest = _applyAuthentication(request);
    http.Response response = await _createResponse(authenticatedRequest);
    dynamic jsonResponse = json.decode(response.body);
    return parser.fromJson(jsonResponse);
  }

  WebRequest _applyAuthentication(WebRequest request) {
    return WebRequest(
      type: request.type,
      path: request.path,
      headers: request.headers,
      params: request.params ?? {}
        ..putIfAbsent('api_key', () => this._apiKey),
      body: request.body,
    );
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
