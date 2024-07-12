import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_database_flutter/generated/locale_keys.g.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movies_database_flutter/core/utilities/app_constants.dart';
import 'package:movies_database_flutter/core/utilities/enums.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie_details_args.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_event.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_state.dart';

class SearchSheet extends StatelessWidget {
  const SearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
      ),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Column(
            children: [
              40.verticalSpace,
              SizedBox(
                height: 150.h,
                width: MediaQuery.of(context).size.width * 0.8,
                child: SearchBar(
                  elevation: const WidgetStatePropertyAll<double>(0),
                  backgroundColor: const WidgetStatePropertyAll<Color>(
                    Colors.black,
                  ),
                  side: const WidgetStatePropertyAll<BorderSide>(BorderSide(color: Colors.white)),
                  hintStyle: WidgetStatePropertyAll<TextStyle>(TextStyle(color: Colors.grey[500]!, fontSize: 35.sp)),
                  textStyle: WidgetStatePropertyAll<TextStyle>(TextStyle(color: Colors.white, fontSize: 35.sp)),
                  hintText: LocaleKeys.moviesScreen_search.tr(),
                  onSubmitted: (value) {
                    context.read<MoviesBloc>().add(SearchPopularMoviesEvent(value));
                  },
                ),
              ),
              30.verticalSpace,
              BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  switch (state.searchState) {
                    case SearchState.loading:
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).indicatorColor,
                        ),
                      );

                    case SearchState.error:
                      return Center(
                        child: Text('Error Retrieving Data \n ${state.popularMessage}'),
                      );

                    case SearchState.loaded:
                      return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: context.watch<MoviesBloc>().state.allMovies.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (context.mounted) {
                                      Navigator.pushNamed(context, '/movieDetails', arguments: MovieDetailsArgs(state.allMovies[index], state.allMovies));
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
                                      child: CachedNetworkImage(
                                        width: 500.sp,
                                        height: 700.sp,
                                        fit: BoxFit.cover,
                                        imageUrl: '${AppConstants.baseImageUrl}${state.allMovies[index].backdropPath}',
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
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 55.sp, vertical: 30.sp),
                                  child: Text(
                                    state.allMovies[index].title!,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );

                    default:
                      return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
