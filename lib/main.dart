import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_client/services/api_configuration/configuration_service.dart';
import 'package:tmdb_client/services/trending/trending_service.dart';
import 'package:tmdb_client/ui/trending/trending_screen.dart';
import 'package:tmdb_client/ui/navigation/primary_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TMDB client'),
        ),
        body: BaseProviders(
          child: Material(
              child: PrimaryNavigation(
            primaryScreens: [
              PrimaryScreenDescriptor(
                TrendingScreen(mediaType: TrendingMediaType.movie),
                Tab(icon: Icon(Icons.movie)),
              ),
              PrimaryScreenDescriptor(
                TrendingScreen(mediaType: TrendingMediaType.tv),
                Tab(icon: Icon(Icons.live_tv)),
              )
            ],
          )),
        ),
      ),
    );
  }
}

class BaseProviders extends StatelessWidget {
  final Widget child;

  const BaseProviders({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => ConfigurationService(),
        ),
        Provider(
          create: (_) => TrendingService(),
        ),
      ],
      child: child,
    );
  }
}
