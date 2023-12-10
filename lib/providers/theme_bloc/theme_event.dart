part of 'theme_bloc.dart';

sealed class ThemeEvent {
  const ThemeEvent();
}

class GetSavedThemeEvent extends ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String themeName;
  ChangeThemeEvent(this.themeName);
}
