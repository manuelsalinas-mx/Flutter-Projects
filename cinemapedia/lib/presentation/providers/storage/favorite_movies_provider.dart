import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/storage/local_storage_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

/*
{
  123: Movie,
  456: Movie,
  789: Movie
}
 */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies =
        await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;

    final moviesMap = <int, Movie>{};
    for (final mov in movies) {
      moviesMap[mov.id] = mov;
    }

    state = {...state, ...moviesMap};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isFavorite = state[movie.id] != null;

    if (isFavorite) {
      // remover y actualizar
      state.remove(movie.id);
      state = {...state};
    } else {
      // agregar y actualizar
      state = {...state, movie.id: movie};
    }
  }
}
