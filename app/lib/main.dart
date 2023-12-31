import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/modules/home/home.dart';
import 'src/themes/color_schemes.g.dart';

void main() {
  runApp(const ProviderScope(child: StartApp()));
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      title: 'Attendence',
      home: const HomeScreen(),
    );
  }
}
