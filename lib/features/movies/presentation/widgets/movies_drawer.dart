
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:movies_database_flutter/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:movies_database_flutter/core/themes/controller/theme_cubit.dart';
import 'package:movies_database_flutter/core/utilities/shared_preferences.dart';

class MoviesDrawer extends StatelessWidget {
  const MoviesDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool themeChoice = true;
    switch (AppPreferences.getThemeMode()) {
      case 'light':
        themeChoice = false;
        break;
      case 'dark':
        themeChoice = true;
        break;
    }
    return GlassContainer.clearGlass(
      width: MediaQuery.of(context).size.width * 0.7,
      borderRadius: BorderRadius.only(topRight: Radius.circular(35.r), bottomRight: Radius.circular(35.r)),
      borderColor: Colors.transparent,
      child: Column(
        children: [
          100.verticalSpace,
          Text(
            LocaleKeys.drawer_changeTheme.tr(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          20.verticalSpace,
          DayNightSwitcher(
            isDarkModeEnabled: themeChoice,
            onStateChanged: (choice) {
              if (choice) {
                AppPreferences.setThemeMode('light');
                context.read<ThemeCubit>().changeTheme();
              } else {
                AppPreferences.setThemeMode('dark');
                context.read<ThemeCubit>().changeTheme();
              }
            },
          ),
          20.verticalSpace,
          Divider(
            endIndent: 50.sp,
            indent: 50.sp,
            thickness: 1.5,
          ),
          50.verticalSpace,
          Text(
            LocaleKeys.drawer_contactUs.tr(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          20.verticalSpace,
          const Text(
            '+201028634578',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          20.verticalSpace,
          ElevatedButton(
            onPressed: () async {
              const url = 'tel:+201028634578';
              await launchUrl(Uri.parse(url));
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.green[600],
              fixedSize: Size(150.w, 150.h),
            ),
            child: const Icon(
              Icons.phone,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
