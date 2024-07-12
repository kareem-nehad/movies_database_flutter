import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_database_flutter/core/utilities/enums.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_event.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_state.dart';
import 'package:movies_database_flutter/features/movies/presentation/screens/search_sheet.dart';
import 'package:movies_database_flutter/features/movies/presentation/widgets/movies_grid_item.dart';
import 'package:movies_database_flutter/generated/locale_keys.g.dart';
import 'package:movies_database_flutter/features/movies/presentation/widgets/movies_drawer.dart';

class MoviesScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MoviesBloc>().add(GetPopularMoviesEvent());
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case RequestState.error:
            return Center(
              child: Text('Error Retrieving Data \n ${state.popularMessage}'),
            );

          case RequestState.loaded:
            return Scaffold(
              key: _key,
              drawerEnableOpenDragGesture: false,
              body: SafeArea(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: CustomScrollView(
                    key: UniqueKey(),
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        forceMaterialTransparency: true,
                        floating: true,
                        snap: true,
                        collapsedHeight: 350.h,
                        expandedHeight: 400.h,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 30.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                50.verticalSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.moviesScreen_moviesDatabase.tr(),
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _key.currentState?.openDrawer();
                                      },
                                      child: const Icon(Icons.view_headline_rounded),
                                    ),
                                  ],
                                ),
                                20.verticalSpace,
                                GestureDetector(
                                  onTap: () {
                                    if (context.mounted) {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return const SearchSheet();
                                        },
                                      );
                                    }
                                  },
                                  child: SizedBox(
                                    height: 100.h,
                                    child: SearchBar(
                                      enabled: false,
                                      elevation: const WidgetStatePropertyAll<double>(0),
                                      backgroundColor: const WidgetStatePropertyAll<Color>(
                                        Colors.black,
                                      ),
                                      side: const WidgetStatePropertyAll<BorderSide>(BorderSide(color: Colors.white)),
                                      hintStyle: WidgetStatePropertyAll<TextStyle>(TextStyle(color: Colors.grey[500]!, fontSize: 35.sp)),
                                      hintText: LocaleKeys.moviesScreen_search.tr(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          titlePadding: EdgeInsets.symmetric(horizontal: 40.sp),
                        ),
                      ),
                      SliverToBoxAdapter(child: 30.verticalSpace),
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          mainAxisSpacing: 15.sp,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          childCount: state.popularMovies.length,
                          (context, index) {
                            final movie = state.popularMovies[index];
                            return MoviesGridItem(
                              movie: movie,
                              allMovies: state.popularMovies,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              drawer: const MoviesDrawer(),
            );
        }
      },
    );
  }
}
