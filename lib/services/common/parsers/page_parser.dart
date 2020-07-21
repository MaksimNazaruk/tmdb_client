import 'package:flutter/foundation.dart';
import 'package:tmdb_client/services/common/parsers/parser.dart';

class PageDescriptor<T> {
  final List<T> items;
  final int totalItems;
  final int pageNumber;
  final int totalPages;

  PageDescriptor({
    @required this.items,
    this.totalItems,
    this.pageNumber,
    this.totalPages,
  });
}

class PageParser<T> implements Parser<PageDescriptor<T>> {
  final Parser<T> itemParser;
  final String resultsKey;

  PageParser({
    @required this.itemParser,
    this.resultsKey = 'results',
  });

  @override
  PageDescriptor<T> fromJson(json) {
    final resultsJson = json[resultsKey];
    if (resultsJson is List) {
      return PageDescriptor(
        items: resultsJson.map((e) => itemParser.fromJson(e)).toList(),
        totalItems: json['total_results'],
        pageNumber: json['page'],
        totalPages: json['total_pages'],
      );
    } else {
      throw Exception('Invalid page format');
    }
  }
}
