import 'package:flutter/material.dart';
import 'mainhome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotto blog',
      home: MainhomePage(),
    );
  }
}
