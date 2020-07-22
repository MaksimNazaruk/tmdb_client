import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_client/services/api_configuration/configuration_service.dart';
import 'package:tmdb_client/services/api_configuration/entities/api_configuration.dart';
import 'package:tmdb_client/services/api_configuration/entities/image_configuration.dart'
    as tmdb;

enum TmdbImageType {
  backdrop,
  logo,
  poster,
  profile,
  still,
}

extension TmdbImageTypeName on TmdbImageType {
  String get name => describeEnum(this);
}

const String _kOriginalImageSize = 'original';

class TmdbImage extends StatelessWidget {
  final String imagePath;
  final double targetWidth;
  final TmdbImageType imageType;

  const TmdbImage(this.imagePath, {Key key, this.targetWidth, this.imageType})
      : assert(imagePath != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigurationService>(
      builder: (_, configurationService, __) {
        return FutureBuilder(
          future: configurationService.getConfiguration(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final ApiConfiguration configuration = snapshot.data;
              return CachedNetworkImage(
                imageUrl: _fullUrl(configuration.imageConfig),
                placeholder: (_, __) => _Placeholder(),
                fit: BoxFit.cover,
              );
            } else {
              return _Placeholder();
            }
          },
        );
      },
    );
  }

  String _fullUrl(tmdb.ImageConfiguration imageConfig) {
    return imageConfig.baseImageUrl + _size(imageConfig) + imagePath;
  }

  String _size(tmdb.ImageConfiguration imageConfig) {
    if (imageType == null) {
      return _kOriginalImageSize;
    }

    List<String> sizes = _sizeGroup(imageConfig);
    if (targetWidth == null) {
      return sizes.last;
    }

    return sizes.firstWhere((sizeName) {
          final size = int.tryParse(sizeName.substring(1));
          return size > targetWidth;
        }) ??
        _kOriginalImageSize;

    // sizes
    //     .map((e) => MapEntry(e, e.substring(1)))
    //     .map((e) => MapEntry(e.key, int.tryParse(e.value)))
    //     .where((e) => e.value != null)
    //     .firstWhere((e) => e.value > targetWidth);

    // sizes
    //     .map((e) => e.substring(1))
    //     .map((e) => int.tryParse(e))
    //     .where((e) => e != null)
    //     .firstWhere((e) => false);
  }

  List<String> _sizeGroup(tmdb.ImageConfiguration imageConfig) {
    switch (imageType) {
      case TmdbImageType.backdrop:
        return imageConfig.backdropSizes;
      case TmdbImageType.logo:
        return imageConfig.logoSizes;
      case TmdbImageType.poster:
        return imageConfig.posterSizes;
      case TmdbImageType.profile:
        return imageConfig.profileSizes;
      case TmdbImageType.still:
        return imageConfig.stillSizes;
      default:
        throw Exception('Unsupported image type');
    }
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(child: Icon(Icons.movie)),
    );
  }
}
