import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok/config/theme/app_theme.dart';
import 'package:tik_tok/infrastructure/datasources/local_videos_datasource_impl.dart';
import 'package:tik_tok/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tik_tok/presentation/providers/discover_provider.dart';
import 'package:tik_tok/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoRepository = VideoPostsRepositoryImpl(videosDatasource: LocalVideosDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) => DiscoverProvider(videosRepository: videoRepository)
              ..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'TikTok',
        debugShowCheckedModeBanner: false,
        theme: Apptheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
