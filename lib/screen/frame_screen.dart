import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/tab_navigation/tab_navigation_event.dart';

import '../data/bloc/tab_navigation/tab_navigation_bloc.dart';
import '../data/bloc/tab_navigation/tab_navigation_state.dart';

class FrameScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const FrameScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabNavigationBloc, TabNavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: navigationShell,
          bottomNavigationBar: NavigationBar(
            selectedIndex: NavItem.values.indexOf(state.selectedItem),
            // navigationShell.currentIndex,
            onDestinationSelected: (int index){
              // print('Selected Tab: ${NavItem.values[index]}');
              context.read<TabNavigationBloc>().add(TabChanged(NavItem.values[index]));
              if (index != navigationShell.currentIndex) {
                navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
              }
            },
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(Icons.article),
                  icon: Icon(Icons.article_outlined),
                  label: '블로그',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: '홈',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: '프로필',
                ),
              ],
            backgroundColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
        );
      }
    );
  }
}






