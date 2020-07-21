import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trending_item.g.dart';

enum TrendingMediaType {
  all,
  movie,
  tv,
  person,
}

extension TrendingMediaTypeValue on TrendingMediaType {
  String get value => describeEnum(this);
}

@JsonSerializable(createToJson: false)
class TrendingItem {
  final int id;
  final bool video;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  final String title;
  final String name;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  final bool adult;
  final String overview;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  final double popularity;
  @JsonKey(name: 'media_type', fromJson: _mediaTypeFromJson)
  final TrendingMediaType mediaType;

  String get displayTitle => title ?? name;

  TrendingItem(
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.name,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.posterPath,
    this.popularity,
    this.mediaType,
  );

  factory TrendingItem.fromJson(json) => _$TrendingItemFromJson(json);
}

TrendingMediaType _mediaTypeFromJson(value) {
  return TrendingMediaType.values
      .firstWhere((element) => element.value == value, orElse: () => null);
}
