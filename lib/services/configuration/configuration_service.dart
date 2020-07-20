import 'package:tmdb_client/services/common/parser.dart';
import 'package:tmdb_client/services/common/tmdb_web_service.dart';
import 'package:tmdb_client/services/common/web_request.dart';
import 'package:tmdb_client/services/configuration/configuration.dart';

class ConfigurationService extends TmdbWebService<Configuration>
    implements Parser<Configuration> {
  Future<Configuration> getConfiguration() async {
    final request = WebRequest(type: WebRequestType.GET, path: 'configuration');
    return performRequest(request);
  }

  @override
  Parser<Configuration> get parser => this;

  @override
  Configuration fromJson(json) {
    print('parsing json: \n$json');
    return Configuration();
  }
}
