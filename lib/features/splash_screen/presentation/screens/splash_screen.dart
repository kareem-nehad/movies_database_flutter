import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_database_flutter/core/utilities/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/movies');
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FadeIn(
            duration: const Duration(seconds: 1, milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            child: SvgPicture.asset(
              AppAssets.splashLogo,
              height: 400.h,
              width: 400.w,
            ),
          ),
        ),
      ),
    );
  }
}
