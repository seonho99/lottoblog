import 'package:flutter/material.dart';
import 'package:lottoblog/personal_screen.dart';

import 'package:lottoblog/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
      // (home: PersonalScreen(),
        .router
      (
      routerConfig: router,
      title: 'Lotto Blog',
      debugShowCheckedModeBanner: false,
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
