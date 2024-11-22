import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void _navigateToWorkoutHome() async {
    await Future.delayed(Duration(seconds: 2));
    context.go('/mainhome');
  }

  @override
  void initState() {
    super.initState();
    _navigateToWorkoutHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child:
            const Image(image: AssetImage('assets/logo/lottoblog_300_300.jpeg'),
            ),
          ),
        ),
      ),
    );
  }
}