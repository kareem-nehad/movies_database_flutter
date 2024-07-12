import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_database_flutter/features/movie_details/presentation/screens/movie_details_screen.dart';
import 'package:movies_database_flutter/features/movies/domain/entities/movie_details_args.dart';
import 'package:movies_database_flutter/features/movies/presentation/screens/movies_screen.dart';
import 'package:movies_database_flutter/features/splash_screen/presentation/screens/splash_screen.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case '/movies':
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => MoviesScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeIn(child: child);
            });

      case '/movieDetails':
        final args = settings.arguments as MovieDetailsArgs;
        return MaterialPageRoute(
          builder: (_) => MovieDetailsScreen(arguments: args),
        );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
