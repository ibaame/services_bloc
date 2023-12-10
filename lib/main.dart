import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_bloc/api/todo_api.dart';
import 'package:services_bloc/layouts/screens/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:services_bloc/providers/connection_bloc/connection_bloc.dart';
import 'package:services_bloc/providers/theme_bloc/theme_bloc.dart';
import 'package:services_bloc/providers/todos_bloc/todos_bloc.dart';

import 'providers/counter_bloc/counter_bloc.dart';
import 'providers/localization_bloc/localization_bloc.dart';
import 'utils/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<LocalizationBloc>(
          create: (BuildContext context) => LocalizationBloc()
            ..add(
              GetSavedLanguageEvent(),
            ),
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc()
            ..add(
              GetSavedThemeEvent(),
            ),
        ),
        BlocProvider<ConnectionBloc>(
          create: (BuildContext context) => ConnectionBloc(),
        ),
        BlocProvider<TodosBloc>(
          create: (BuildContext context) =>
              TodosBloc(TodosApi())..add(GetAllTodosEvent()),
        ),
      ],
      child: Builder(builder: (context) {
        // like multiBlocBuilder
        final localState = context.watch<LocalizationBloc>().state;
        final themeState = context.watch<ThemeBloc>().state;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: localState.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en'), Locale('ar')],
          theme: themeState.theme,
          home: const Home(),
        );
      }),
    );
  }
}
