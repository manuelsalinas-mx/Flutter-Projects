import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomneView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomneView extends ConsumerStatefulWidget {
  const _HomneView();

  @override
  _HomneViewState createState() => _HomneViewState();
}

class _HomneViewState extends ConsumerState<_HomneView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
            titlePadding: EdgeInsets.zero,
            ),
        ),

        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(children: [
            // const CustomAppBar(),
            MovieSlideshow(movies: slideShowMovies),
            MoviesHorizontalListview(
              movies: nowPlayingMovies,
              title: 'En Cines',
              subtitle: 'Hoy',
              loadNextPage: () {
                // print('Llamado del padre');
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MoviesHorizontalListview(
              movies: nowPlayingMovies,
              title: 'Proximamente',
              subtitle: 'Este mes',
              loadNextPage: () {
                // print('Llamado del padre');
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MoviesHorizontalListview(
              movies: nowPlayingMovies,
              title: 'Populares',
              loadNextPage: () {
                // print('Llamado del padre');
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MoviesHorizontalListview(
              movies: nowPlayingMovies,
              title: 'Las mas votadas',
              subtitle: 'del año',
              loadNextPage: () {
                // print('Llamado del padre');
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            const SizedBox(height: 10),
          ]);
        }, childCount: 1))
      ],
    );
  }
}
