import 'package:flutter/foundation.dart';
import 'package:tmdb_client/services/common/parsers/page_parser.dart';
import 'package:tmdb_client/services/common/tmdb_web_service.dart';
import 'package:tmdb_client/services/common/web_request.dart';
import 'package:tmdb_client/services/trending/entities/trending_item.dart';
import 'package:tmdb_client/services/trending/parsers/trending_item_parser.dart';

enum TrendingMediaType {
  all,
  movie,
  tv,
  person,
}

extension TrendingMediaTypeValue on TrendingMediaType {
  String get value => describeEnum(this);
}

enum TrendingTimeWindow {
  day,
  week,
}

extension TrendingTimeWindowValue on TrendingTimeWindow {
  String get value => describeEnum(this);
}

class TrendingService extends TmdbWebService {
  final _trendingItemsParser = PageParser(itemParser: TrendingItemParser());

  Future<PageDescriptor<TrendingItem>> trendingMedia(
    TrendingMediaType mediaType,
    TrendingTimeWindow timeWindow,
  ) async {
    final request = WebRequest(
        type: WebRequestType.GET,
        path: 'trending/${mediaType.value}/${timeWindow.value}');

    return await fetchData(request, _trendingItemsParser);
  }
}
