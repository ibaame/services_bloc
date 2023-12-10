import 'package:flutter/material.dart';
import 'package:services_bloc/layouts/screens/connection.dart';
import 'package:services_bloc/layouts/screens/counter.dart';
import 'package:services_bloc/layouts/screens/localization.dart';
import 'package:services_bloc/layouts/screens/theme.dart';
import 'package:services_bloc/layouts/screens/todos_screen.dart';
import 'package:services_bloc/layouts/widgets/card_info_feature.dart';
import 'package:services_bloc/utils/app_localizations.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 225,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CardInfoFeature("counter".tr(context), Icons.add, () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Counter(),
                ),
              );
            }),
            CardInfoFeature(
              'language'.tr(context),
              Icons.language,
              () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Localization(),
                  ),
                );
              },
            ),
            CardInfoFeature(
              'theme'.tr(context),
              Icons.dark_mode,
              () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ThemeScreen(),
                  ),
                );
              },
            ),
            CardInfoFeature(
              'connection'.tr(context),
              Icons.link_rounded,
              () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ConnectionScreen(),
                  ),
                );
              },
            ),
            CardInfoFeature(
              'API',
              Icons.link_rounded,
              () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TodosScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
