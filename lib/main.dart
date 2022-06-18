import 'package:flutter/material.dart';

import 'ui/splash_screen.dart';
import 'util/hex_color.dart';
import 'util/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluteMovie',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        fontFamily: 'Lato',
        scaffoldBackgroundColor: HexColor.background,
        tabBarTheme: TabBarTheme(
          labelColor:HexColor.accentColor
        )
      ),
      home: const SplashScreen(),
    );
  }
}
