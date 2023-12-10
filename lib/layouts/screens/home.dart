import 'package:flutter/material.dart';
import 'package:services_bloc/layouts/screens/drawer.dart';
import 'package:services_bloc/utils/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: const Menu(),
      body: Center(
        child: Text(
          'welcome'.tr(context),
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
