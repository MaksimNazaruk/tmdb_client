// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageConfiguration _$ImageConfigurationFromJson(Map<String, dynamic> json) {
  return ImageConfiguration(
    json['base_url'] as String,
    json['secure_base_url'] as String,
    (json['backdrop_sizes'] as List)?.map((e) => e as String)?.toList(),
    (json['logo_sizes'] as List)?.map((e) => e as String)?.toList(),
    (json['poster_sizes'] as List)?.map((e) => e as String)?.toList(),
    (json['profile_sizes'] as List)?.map((e) => e as String)?.toList(),
    (json['still_sizes'] as List)?.map((e) => e as String)?.toList(),
  );
}
