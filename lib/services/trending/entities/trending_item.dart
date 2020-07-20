import 'package:json_annotation/json_annotation.dart';

part 'trending_item.g.dart';

@JsonSerializable(createToJson: false)
class TrendingItem {
  final int id;
  final bool video;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  final String title;
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
  @JsonKey(name: 'media_type')
  final String mediaType; // TODO(MN): use enum

  TrendingItem(
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
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
