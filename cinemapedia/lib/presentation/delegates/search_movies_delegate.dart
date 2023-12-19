import 'dart:async';
import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;

  // For Stream
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  Timer? _debouncedTimer;

  // Loading indicator
  StreamController<bool> isLoadingStream = StreamController.broadcast();

  SearchMoviesDelegate(
      {required this.searchMovies, required this.initialMovies});

  /* * * * * * * * * * * *  Stream Functions * * * * * * * * * * * * * * * * * */
  void clearStreams() {
    isLoadingStream.close();
    debouncedMovies.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);
    
    // Cancelar si esta activo?
    if (_debouncedTimer?.isActive ?? false) _debouncedTimer?.cancel();

    // Activando timer
    _debouncedTimer = Timer(const Duration(milliseconds: 500), () async {
      // Buscando...
      final movies = await searchMovies(query);
      initialMovies = movies;
      debouncedMovies.add(movies);
      isLoadingStream.add(false);
    });
  }

  /* * * * * * *  * * Suggestions & Results Widget * * * * * * * * * */
  /// This function avoids spaguetti / duplicated code
  Widget _buildResultsAndSuggestions() {
    return StreamBuilder(
        initialData: initialMovies,
        stream: debouncedMovies.stream,
        builder: (context, snapshot) {
          final movies = snapshot.data ?? [];

          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => _MovieSearchItem(
                  movie: movies[index],
                  onMovieSelected: (context, movie) {
                    clearStreams();
                    close(context, movie);
                  }));
        });
  }

  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  @override
  String? get searchFieldLabel => 'Buscar Pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
          stream: isLoadingStream.stream,
          builder: (context, snapshot) {
            final isSearching = snapshot.data ?? false;
          
          // Loading indicator
          if (isSearching) {         
              return SpinPerfect(
                  duration: const Duration(seconds: 20),
                  spins: 10,
                  infinite: true,
                  child: IconButton(
                      onPressed: () => query = '',
                      icon: const Icon(Icons.refresh)));
            }

          // Clear indicator
            return FadeIn(
                animate: query.isNotEmpty,
                child: IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(Icons.clear)));
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return _buildResultsAndSuggestions();
  }
}

class _MovieSearchItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieSearchItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          onMovieSelected(context, movie);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              SizedBox(
                  width: size.width * 0.2,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        movie.posterPath,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return const CircularProgressIndicator();
                          }

                          return FadeIn(child: child);
                        },
                      ))),

              const SizedBox(width: 10),

              // Info
              SizedBox(
                  width: size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title, style: textStyles.titleMedium),
                      if (movie.overview.isNotEmpty)
                        Text(movie.overview,
                            style: textStyles.bodySmall,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis),
                      Row(children: [
                        Icon(Icons.star_half_rounded,
                            color: Colors.yellow[800]),
                        const SizedBox(width: 5),
                        Text(
                            HumanFormats.humanReadableNumber(
                                movie.voteAverage, 1),
                            style: TextStyle(color: Colors.yellow[900]))
                      ]),
                    ],
                  )),
            ],
          ),
        ));
  }
}
