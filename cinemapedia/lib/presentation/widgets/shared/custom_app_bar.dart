import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movies_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Row(children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapedia', style: titleStyle),
              const Spacer(),
              IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final searchedMovies = ref.read(searchedMoviesProvider);
                    final searchQuery = ref.read(searchQueryProvider);

                    // Busqueda
                    showSearch<Movie?>(
                        query: searchQuery,
                        context: context,
                        delegate: SearchMoviesDelegate(
                          initialMovies: searchedMovies,
                          searchMovies: (query) {
                          // Store last query search on provider
                          return ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery(query);
                        })).then((selectedMovie) {
                      if (selectedMovie == null) return;
                      context.push('/home/0/movie/${selectedMovie.id}');
                    });
                  }),
            ]),
          ),
        ));
  }
}
