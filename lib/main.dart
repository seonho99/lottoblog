import 'package:flutter/material.dart';
import 'package:lottoblog/login_page.dart';
import 'package:lottoblog/mypage_page.dart';
import 'userwriting_page.dart';
import 'mainhome_page.dart';
import 'author_day_page.dart';
import 'personalized_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto blog',
      home:UserwritingPage(),
    );
  }
}
