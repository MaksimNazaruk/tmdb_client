import 'package:tmdb_client/services/common/parsers/parser.dart';

class PageParser<T> implements Parser<List<T>> {
  final Parser<T> itemParser;
  final String resultsKey;

  PageParser({
    this.itemParser,
    this.resultsKey = 'results',
  });

  @override
  List<T> fromJson(json) {
    final resultsJson = json[resultsKey];
    if (resultsJson is List) {
      return resultsJson.map((e) => itemParser.fromJson(e)).toList();
    } else {
      throw Exception('Invalid page format');
    }
  }
}
