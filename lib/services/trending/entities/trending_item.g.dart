// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingItem _$TrendingItemFromJson(Map<String, dynamic> json) {
  return TrendingItem(
    json['id'] as int,
    json['video'] as bool,
    json['vote_count'] as int,
    (json['vote_average'] as num)?.toDouble(),
    json['title'] as String,
    json['release_date'] as String,
    json['original_language'] as String,
    json['original_title'] as String,
    (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
    json['backdrop_path'] as String,
    json['adult'] as bool,
    json['overview'] as String,
    json['poster_path'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['media_type'] as String,
  );
}
