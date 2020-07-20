import 'package:tmdb_client/services/common/parsers/parser.dart';
import 'package:tmdb_client/services/api_configuration/entities/image_configuration.dart';

class ImageConfigurationParser implements Parser<ImageConfiguration> {
  @override
  ImageConfiguration fromJson(json) {
    return ImageConfiguration.fromJson(json);
  }
}
