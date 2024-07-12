import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movies_database_flutter/core/utilities/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(DarkTheme()) {
    _init();
  }

  Future<void> _init() async {
    final String? brightness;
    if (AppPreferences.getThemeMode() == null) {
      brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness.name;
      AppPreferences.setThemeMode(brightness);
    } else {
      brightness = AppPreferences.getThemeMode();
    }

    switch (brightness) {
      case 'light':
        emit(LightTheme());
      case 'dark':
        emit(DarkTheme());
    }
  }

  void changeTheme() async {
    switch (AppPreferences.getThemeMode()) {
      case 'dark':
        emit(LightTheme());
        AppPreferences.setThemeMode('light');
        break;
      case 'light':
        emit(DarkTheme());
        AppPreferences.setThemeMode('dark');
        break;
    }
  }
}
