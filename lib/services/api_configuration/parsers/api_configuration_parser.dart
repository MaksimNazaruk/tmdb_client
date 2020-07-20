import 'package:tmdb_client/services/api_configuration/entities/api_configuration.dart';
import 'package:tmdb_client/services/api_configuration/entities/image_configuration.dart';
import 'package:tmdb_client/services/api_configuration/parsers/image_configuration_parser.dart';
import 'package:tmdb_client/services/common/parsers/parser.dart';

class ApiConfigurationParser implements Parser<ApiConfiguration> {
  final _imageConfigurationParser = ImageConfigurationParser();

  @override
  ApiConfiguration fromJson(json) {
    final imageConfigurationJson = json['images'];
    ImageConfiguration imageConfig;
    if (imageConfigurationJson != null) {
      imageConfig = _imageConfigurationParser.fromJson(imageConfigurationJson);
    }

    return ApiConfiguration(imageConfig: imageConfig);
  }
}
