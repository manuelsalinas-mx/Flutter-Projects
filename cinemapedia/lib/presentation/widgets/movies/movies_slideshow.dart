
import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MovieSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
      final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        itemBuilder: (context, index) => _SlideView(movie: movies[index]),
        viewportFraction: 0.85,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(top:0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary
          ),
          ),
        onTap: (index) => context.push('/movie/${movies[index].id}'),
      ),
    );
  }
}

class _SlideView extends StatelessWidget {
  final Movie movie;

  const _SlideView({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12));
                }

                return FadeIn(child: child);
              },
            )),
      ),
    );
  }
}
