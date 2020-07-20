import 'package:json_annotation/json_annotation.dart';

part 'image_configuration.g.dart';

@JsonSerializable(createToJson: false)
class ImageConfiguration {
  @JsonKey(name: 'base_url')
  final String baseImageUrl;
  @JsonKey(name: 'secure_base_url')
  final String secureBaseUrl;
  @JsonKey(name: 'backdrop_sizes')
  final List<String> backdropSizes;
  @JsonKey(name: 'logo_sizes')
  final List<String> logoSizes;
  @JsonKey(name: 'poster_sizes')
  final List<String> posterSizes;
  @JsonKey(name: 'profile_sizes')
  final List<String> profileSizes;
  @JsonKey(name: 'still_sizes')
  final List<String> stillSizes;

  ImageConfiguration(
    this.baseImageUrl,
    this.secureBaseUrl,
    this.backdropSizes,
    this.logoSizes,
    this.posterSizes,
    this.profileSizes,
    this.stillSizes,
  );

  @override
  factory ImageConfiguration.fromJson(json) =>
      _$ImageConfigurationFromJson(json);
}
