import 'package:flutter/material.dart';
import 'package:lottoblog/author_day_page.dart';
import 'package:lottoblog/bottomnavigationbar_example.dart';
import 'package:lottoblog/personalized_page.dart';
import 'mainhome_page.dart';
import 'personalized_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto blog',
      home: BottomNavigationBarExample(),
    );
  }
}
