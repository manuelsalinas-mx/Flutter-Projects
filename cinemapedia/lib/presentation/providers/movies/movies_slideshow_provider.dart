import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  // is Empty?
  if (nowPlayingMovies.isEmpty) return [];

  // Returns 6 movies only
  return nowPlayingMovies.sublist(0, 6);
});
