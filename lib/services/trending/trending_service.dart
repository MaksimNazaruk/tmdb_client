import 'package:tmdb_client/services/common/parsers/page_parser.dart';
import 'package:tmdb_client/services/common/tmdb_web_service.dart';
import 'package:tmdb_client/services/common/web_request.dart';
import 'package:tmdb_client/services/trending/entities/trending_item.dart';
import 'package:tmdb_client/services/trending/parsers/trending_item_parser.dart';

class TrendingService extends TmdbWebService {
  final _trendingItemsParser = PageParser(itemParser: TrendingItemParser());

  Future<List<TrendingItem>> trendingMovies() async {
    final request =
        WebRequest(type: WebRequestType.GET, path: 'trending/movie/week');

    return await fetchData(request, _trendingItemsParser);
  }
}
