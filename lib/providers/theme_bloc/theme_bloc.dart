import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:services_bloc/cache/theme.dart';
import 'package:services_bloc/theme/colors.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ChangeThemeState> {
  ThemeBloc() : super(ChangeThemeState(themes['blue']!)) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetSavedThemeEvent) {
        final themeName = await ThemeCacheHelper().getTheme();
        emit(ChangeThemeState(themes[themeName]!));
      } else if (event is ChangeThemeEvent) {
        await ThemeCacheHelper().saveTheme(event.themeName);
        emit(ChangeThemeState(themes[event.themeName]!));
      }
    });
  }
}
