import 'package:tmdb_client/services/common/parsers/parser.dart';
import 'package:tmdb_client/services/trending/entities/trending_item.dart';

class TrendingItemParser implements Parser<TrendingItem> {
  @override
  TrendingItem fromJson(json) => TrendingItem.fromJson(json);
}
