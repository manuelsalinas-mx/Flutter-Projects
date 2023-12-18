import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const name = 'movie-screen';

  final String movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (movie == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(movie: movie),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _MovieDetails(movie: movie),
                  childCount: 1))
        ],
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;
  const _MovieDetails({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: size.width * 0.3,
              ),
            ),
            const SizedBox(width: 10),

            // descripcion
            SizedBox(
              width: (size.width - 40) * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleLarge),
                  Text(movie.overview),
                ],
              ),
            ),
          ],
        ),
      ),

      // Generos
      Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map((genre) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Chip(
                      label: Text(genre),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )),
            ],
          )),

      // Staff
      _ActorsByMovie(movieId: movie.id.toString()),

      const SizedBox(height: 20),
    ]);
  }
}

class _ActorsByMovie extends ConsumerWidget {
  final String movieId;

  const _ActorsByMovie({
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorsByMovie = ref.watch(actorsByMovieProvider);

    if (actorsByMovie[movieId] == null) {
      return const CircularProgressIndicator();
    }

    final actors = actorsByMovie[movieId]!;

    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: actors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => _ActorView(actor: actors[index])),
    );
  }
}

class _ActorView extends StatelessWidget {
  final Actor actor;

  const _ActorView({
    required this.actor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: 135,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Actor Photo
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                actor.profilePath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) return const SizedBox();
                return FadeInRight(child: child);
              }
              )),
          const SizedBox(height: 15),
          // Nombre
          Text(actor.name, maxLines: 2),
          Text(
            actor.character ?? '',
            maxLines: 2,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      expandedHeight: size.height * 0.7,
      flexibleSpace: FlexibleSpaceBar(
        // titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // title: Text(movie.title,
        //     style: const TextStyle(fontSize: 20), textAlign: TextAlign.start),
        background: Stack(children: [
          SizedBox.expand(
            child: Image.network(
              movie.posterPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) return const SizedBox();
                return FadeIn(child: child);
              },
            ),
          ),
          const SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.7, 1.0],
                        colors: [Colors.transparent, Colors.black87]))),
          ),
          const SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        stops: [0.0, 0.3],
                        colors: [Colors.black87, Colors.transparent]))),
          )
        ]),
      ),
    );
  }
}
