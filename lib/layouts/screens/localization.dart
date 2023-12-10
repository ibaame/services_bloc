import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_bloc/providers/localization_bloc/localization_bloc.dart';
import 'package:services_bloc/utils/app_localizations.dart';

class Localization extends StatelessWidget {
  const Localization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${"language".tr(context)}: ${"languageCode".tr(context)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Text(
              '${"change".tr(context)} ${"language".tr(context)}',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    BlocProvider.of<LocalizationBloc>(context)
                        .add(ChangeLanguageEvent('en'));
                    // Navigator.pop(context);
                  },
                  child: const Text(
                    'english',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    BlocProvider.of<LocalizationBloc>(context)
                        .add(ChangeLanguageEvent('ar'));
                    // Navigator.pop(context);
                  },
                  child: const Text(
                    'العربية',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
