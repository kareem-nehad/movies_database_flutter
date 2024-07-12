import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie_details_args.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movies_database_flutter/core/utilities/app_constants.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie.dart';

class MoviesGridItem extends StatelessWidget {
  const MoviesGridItem({
    super.key,
    required this.movie, required this.allMovies,
  });

  final Movie movie;
  final List<Movie> allMovies;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GestureDetector(
            onTap: () {
              if(context.mounted) {
                Navigator.pushNamed(context, '/movieDetails', arguments: MovieDetailsArgs(movie, allMovies));
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25.r)),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Hero(
                  tag: movie.id,
                  transitionOnUserGestures: true,
                  child: CachedNetworkImage(
                    width: 500.sp,
                    height: 700.sp,
                    fit: BoxFit.cover,
                    imageUrl: '${AppConstants.baseImageUrl}${movie.backdropPath}',
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 500.sp,
                        width: 400.sp,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.sp, vertical: 30.sp),
            child: Text(
              movie.title!,
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}