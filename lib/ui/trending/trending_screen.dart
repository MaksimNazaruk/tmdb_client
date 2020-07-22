import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_client/services/common/parsers/page_parser.dart';
import 'package:tmdb_client/services/trending/trending_service.dart';
import 'package:tmdb_client/ui/common/item_tile.dart';

class TrendingScreen extends StatelessWidget {
  final TrendingMediaType mediaType;

  const TrendingScreen({
    Key key,
    @required this.mediaType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TrendingService>(
      builder: (_, service, __) {
        return FutureBuilder(
            future: service.trendingMedia(
              mediaType,
              TrendingTimeWindow.day,
            ),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return _ItemsGrid(
                    items:
                        (snapshot.data as PageDescriptor<TrendingItem>).items);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      },
    );
  }
}

class _ItemsGrid extends StatelessWidget {
  final List<TrendingItem> items;

  const _ItemsGrid({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(Object context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 16,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        padding: EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (_, index) {
          final item = items[index];
          return ItemTile(
            title: item.displayTitle,
            posterPath: item.posterPath,
          );
        });
  }
}
