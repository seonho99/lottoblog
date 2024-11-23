import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FramScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const FramScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(index,
              initialLocation: index == navigationShell.currentIndex);
        },
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(Icons.article),
              icon: Icon(Icons.article_outlined),
              label: '블로그'),
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: '홈'),
          NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: '프로필'),
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}