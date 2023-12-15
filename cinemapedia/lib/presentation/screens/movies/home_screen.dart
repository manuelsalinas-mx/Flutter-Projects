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

    return Column(
      children: [
        CustomAppBar(),
        MovieSlideshow(movies: nowPlayingMovies),

      ]
      );
  }
}
