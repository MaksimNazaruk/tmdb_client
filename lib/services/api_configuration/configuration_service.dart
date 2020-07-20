import 'package:tmdb_client/services/api_configuration/parsers/api_configuration_parser.dart';
import 'package:tmdb_client/services/common/tmdb_web_service.dart';
import 'package:tmdb_client/services/common/web_request.dart';
import 'package:tmdb_client/services/api_configuration/entities/api_configuration.dart';

class ConfigurationService extends TmdbWebService {
  final _apiConfigurationParser = ApiConfigurationParser();

  Future<ApiConfiguration> getConfiguration() async {
    final request = WebRequest(type: WebRequestType.GET, path: 'configuration');
    return await fetchData(request, _apiConfigurationParser);
  }
}
