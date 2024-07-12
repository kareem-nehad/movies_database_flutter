import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie_details_args.dart';
import 'package:movies_database_flutter/generated/locale_keys.g.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movies_database_flutter/core/utilities/app_constants.dart';
import 'package:movies_database_flutter/features/movie_details/presentation/widgets/other_popular_movies.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieDetailsArgs arguments;

  const MovieDetailsScreen({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                collapsedHeight: 250.h,
                expandedHeight: MediaQuery.of(context).size.height * 0.45,
                flexibleSpace: Stack(
                  children: [
                    FlexibleSpaceBar(
                        background: Hero(
                      tag: arguments.movie.id,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.transparent, Colors.transparent],
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: '${AppConstants.baseImageUrl}${arguments.movie.backdropPath}',
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
                    )),
                    Padding(
                      padding: EdgeInsets.all(30.sp),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '${LocaleKeys.movieDetails_releaseDate.tr()}${arguments.movie.releaseDate}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      50.verticalSpace,
                      Text(
                        arguments.movie.title!,
                        textScaler: const TextScaler.linear(2),
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            size: 125.sp,
                            color: Colors.amber,
                            shadows: const [
                              Shadow(
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          30.horizontalSpace,
                          Text(
                            '${arguments.movie.voteAverage?.toStringAsPrecision(2)} / 10',
                            style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      10.verticalSpace,
                      Divider(
                        indent: 50.sp,
                        endIndent: 50.sp,
                        thickness: 1.5,
                      ),
                      10.verticalSpace,
                      Text(
                        '${LocaleKeys.movieDetails_overview.tr()}: ',
                        textScaler: const TextScaler.linear(1.5),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      20.verticalSpace,
                      Text(arguments.movie.overview!),
                      30.verticalSpace,
                      Lottie.asset(
                        'assets/lottie/ticket.json',
                        frameRate: const FrameRate(120),
                        filterQuality: FilterQuality.high,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              backgroundColor: Colors.amber,
                              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 150.h)),
                          child: Text(
                            LocaleKeys.movieDetails_bookNow.tr(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      50.verticalSpace,
                      Divider(
                        endIndent: 50.sp,
                        indent: 50.sp,
                        thickness: 1.5,
                      ),
                      50.verticalSpace,
                      Text(
                        LocaleKeys.movieDetails_otherPopular.tr(),
                        textScaler: const TextScaler.linear(1.5),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      20.verticalSpace,
                      OtherPopularMoviesGrid(arguments: arguments),
                      30.verticalSpace,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


