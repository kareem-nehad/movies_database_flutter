import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_database_flutter/core/utilities/service_locator.dart';
import 'package:movies_database_flutter/features/movies/presentation/controller/movies_bloc.dart';
import 'core/router/route_generator.dart';
import 'core/themes/app_theme.dart';
import 'features/splash_screen/presentation/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2340),
      minTextAdapt: true,
      builder: (_, builder) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ServiceLocator.instance<MoviesBloc>()),
          ],
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getAppTheme(context),
            onGenerateRoute: RouteGenerator.generateRoute,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
