import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../data/bloc/tab_navigation/tab_navigation_bloc.dart';
import '../data/bloc/tab_navigation/tab_navigation_event.dart';
import '../data/bloc/tab_navigation/tab_navigation_state.dart';

class FramScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const FramScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabNavigationBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<TabNavigationBloc, TabNavigationState>(
          builder: (context, state) {

            final selectedIndex = state is TabChangedState
                ? state.selectedIndex
                : navigationShell.currentIndex;

            return navigationShell;
          },
        ),
        bottomNavigationBar: BlocBuilder<TabNavigationBloc, TabNavigationState>(
          builder: (context, state) {

            final selectedIndex = state is TabChangedState
                ? state.selectedIndex
                : navigationShell.currentIndex;

            return NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {

                context.read<TabNavigationBloc>().add(TabChangedEvent(index));
                navigationShell.goBranch(index,
                    initialLocation: index == selectedIndex)
                ;
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
            );
          },
        ),
      ),
    );
  }
}
