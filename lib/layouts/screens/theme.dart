import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:services_bloc/providers/theme_bloc/theme_bloc.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Themes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ChangeThemeEvent('red'));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ChangeThemeEvent('dark'));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3A3838),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<ThemeBloc>(context)
                            .add(ChangeThemeEvent('blue'));
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
