import 'package:tmdb_client/services/common/web_request.dart';
import 'package:tmdb_client/services/common/web_service.dart';

abstract class TmdbWebService extends WebService {
  // TODO(MN): inject base web service configuration
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String _apiKey = '91a589dc087d7416b8da96aad8844a29';

  WebRequest _applyApiAuthentication(WebRequest request) {
    return WebRequest(
      type: request.type,
      path: request.path,
      headers: request.headers,
      params: request.params ?? {}
        ..putIfAbsent('api_key', () => this._apiKey),
      body: request.body,
    );
  }

  Future<dynamic> performRequest(WebRequest request) async {
    var authenticatedRequest = _applyApiAuthentication(request);
    return super.performRequest(authenticatedRequest);
  }
}
