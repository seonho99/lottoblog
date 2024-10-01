import 'package:flutter/material.dart';
import 'package:lottoblog/bestlike_widget.dart';
import 'package:lottoblog/blogpost_screen.dart';
import 'package:lottoblog/login_screen.dart';
import 'package:lottoblog/personal_screen.dart';
import 'blogwriting_screen.dart';
import 'mainhome_screen.dart';
import 'dayofweek_screen.dart';
import 'editprofile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto blog',
      home:DayOfWeekScreen(),
    );
  }
}
