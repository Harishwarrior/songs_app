import 'package:flutter/material.dart';
import 'package:songs_app/src/features/navigation/presentation/pages/navigation_page.dart';

class SongsApp extends StatelessWidget {
  const SongsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Songs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      home: const NavigationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
