import 'package:LottoBlog/blogwriting_screen.dart';
import 'package:LottoBlog/editprofile_screen.dart';
import 'package:LottoBlog/fram_screen.dart';
import 'package:LottoBlog/listofposts_screen.dart';
import 'package:LottoBlog/login_screen.dart';
import 'package:LottoBlog/personal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'landing_screen.dart';
import 'mainhome_screen.dart';
import 'blogpost_screen/blogpost_screen01.dart';
import 'dayofweek_screen.dart';

// final GlobalObjectKey<NavigatorState> _rootNavigatorKey = GlobalKey(NavigatorState)(debugLabel: 'root');
// final GlobalObjectKey<NavigatorState> _articleNavigatorKey = GlobalKey(NavigatorState)(debugLabel: 'articleTab');
// final GlobalObjectKey<NavigatorState> _homeNavigatorKey = GlobalKey(NavigatorState)(debugLabel: 'homeTab');
// final GlobalObjectKey<NavigatorState> _settingsTabNavigatorKey = GlobalKey(NavigatorState)(debugLabel: 'settingTab');

final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _articleNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'articleTab');
final GlobalKey<NavigatorState> _homeNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'homeTab');
final GlobalKey<NavigatorState> _settingsTabNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'settingTab');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => LandingScreen(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state, navigationShell) {
        return FramScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _articleNavigatorKey,
          routes: [
            GoRoute(
              path: '/mainhome_screen',
              builder: (context, state) {
                return MainHomeScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'blogpost_screen01',
                  builder: (BuildContext context, GoRouterState state) {
                    return BlogPostScreen01();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/dayofweek_screen',
              builder: (context, state) {
                return DayOfWeekScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'blogpost_screen01',
                  builder: (BuildContext context, GoRouterState state) {
                    return BlogPostScreen01();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/personal_screen',
              builder: (context, state) {
                return PersonalScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'editprofile_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    return EditProfileScreen();
                  },
                ),
                GoRoute(
                  path: 'blogwriting_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    return BlogWritingScreen();
                  },
                ),
                GoRoute(
                  path: 'listofposts_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    return ListofpostsScreen();
                  },
                ),
              ],
            ),
          ],
        )
      ],
    ),
  ],
);