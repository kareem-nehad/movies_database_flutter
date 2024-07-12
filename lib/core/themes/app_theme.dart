import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/theme_cubit.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

abstract class AppTheme implements ThemeData {
  static ThemeData getAppTheme (BuildContext context) {
    final state = context.watch<ThemeCubit>().state;

    switch (state) {
      case LightTheme():
        return AppLightThemeData.appLightTheme();
      case DarkTheme():
        return AppDarkThemeData.appDarkTheme();
    }
  }

  static void changeAppTheme (BuildContext context) {
    context.read<ThemeCubit>().changeTheme();
  }
}