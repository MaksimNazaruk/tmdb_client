import 'package:flutter/material.dart';
import 'package:tmdb_client/ui/common/tmdb_image.dart';

class ItemTile extends StatelessWidget {
  final String title;
  final String posterPath;

  const ItemTile({Key key, this.title, this.posterPath}) : super(key: key);

  @override
  Widget build(Object context) {
    return Column(children: [
      AspectRatio(
        aspectRatio: 2 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: TmdbImage(posterPath),
        ),
      ),
      SizedBox(height: 5),
      Text(
        title,
        maxLines: 2,
      ),
    ]);
  }
}
