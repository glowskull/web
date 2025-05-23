import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/colors.dart';
import 'package:responsive_product_web_page/pages/about_page.dart';
import 'package:responsive_product_web_page/pages/chibi_chess_page.dart';
import 'package:responsive_product_web_page/pages/clash_of_crowns_page.dart';
import 'package:responsive_product_web_page/pages/games_page.dart';
import 'package:responsive_product_web_page/pages/product_page.dart';

import 'pages/product_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // Helper to find the state from anywhere in the widget tree.
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = true; // Dark by default.

  void toggleTheme() => setState(() => isDark = !isDark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xbox',
      theme: ThemeData(
        brightness: Brightness.light,
        unselectedWidgetColor: AppColors.black,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 16, fontFamily: "BarlowCondensed"),
            ),
            overlayColor:
            MaterialStateProperty.all(Colors.transparent),
            foregroundColor:
            MaterialStateProperty.all(AppColors.black),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.green,
          onPrimary: AppColors.white,
          secondary: AppColors.white,
          onSecondary: AppColors.black,
          error: AppColors.red,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        unselectedWidgetColor: AppColors.white,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 16, fontFamily: "BarlowCondensed"),
            ),
            overlayColor:
            MaterialStateProperty.all(Colors.transparent),
            foregroundColor:
            MaterialStateProperty.all(AppColors.white),
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.green,
          onPrimary: AppColors.white,
          secondary: AppColors.black,
          onSecondary: AppColors.white,
          error: AppColors.red,
        ),
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/about',
      routes: {
        '/games': (_) => const GamesPage(),
        '/about': (_) => const AboutPage(),
        '/games/chibi-chess': (_) => const ChibiChessPage(),
        '/games/clash-of-crowns': (_) => const ClashOfCrownsPage(),
      },
    );
  }
}
