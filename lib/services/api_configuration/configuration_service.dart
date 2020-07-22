import 'package:tmdb_client/services/api_configuration/parsers/api_configuration_parser.dart';
import 'package:tmdb_client/services/common/tmdb_web_service.dart';
import 'package:tmdb_client/services/common/web_request.dart';
import 'package:tmdb_client/services/api_configuration/entities/api_configuration.dart';

class ConfigurationService extends TmdbWebService {
  final _apiConfigurationParser = ApiConfigurationParser();

  ApiConfiguration _cachedConfiguration;

  Future<ApiConfiguration> getConfiguration({bool forceUpdate = false}) async {
    if (_cachedConfiguration == null || forceUpdate) {
      final request =
          WebRequest(type: WebRequestType.GET, path: 'configuration');
      _cachedConfiguration = await fetchData(request, _apiConfigurationParser);
    }

    return Future.value(_cachedConfiguration);
  }
}
