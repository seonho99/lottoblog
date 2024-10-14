import 'package:LottoBlog/router.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lotto Blog',
      routerConfig: router,
      theme: ThemeData(
        fontFamily: 'NanumSquareNeo',
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          headlineMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          displaySmall: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.normal,
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.normal,
          ),
          displayLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
