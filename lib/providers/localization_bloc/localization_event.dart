part of 'localization_bloc.dart';

sealed class LocalizationEvent {
  const LocalizationEvent();
}

class GetSavedLanguageEvent extends LocalizationEvent {}

class ChangeLanguageEvent extends LocalizationEvent {
  final String languageCode;
  ChangeLanguageEvent(this.languageCode);
}
