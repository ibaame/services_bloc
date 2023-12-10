import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:services_bloc/cache/language.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, ChangeLanguage> {
  LocalizationBloc() : super(ChangeLanguage(const Locale('en'))) {
    on<LocalizationEvent>((event, emit) async {
      if (event is GetSavedLanguageEvent) {
        final String cachedLanguageCode =
            await LanguageCacheHelper().getLanguageCode();
        emit(ChangeLanguage(Locale(cachedLanguageCode)));
      } else if (event is ChangeLanguageEvent) {
        await LanguageCacheHelper().saveLanguageCode(event.languageCode);
        emit(ChangeLanguage(Locale(event.languageCode)));
      }
    });
  }
}
