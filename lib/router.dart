import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/screen/postwriting_screen.dart';

import 'data/bloc/login/login_bloc.dart';
import 'data/bloc/login/login_state.dart';

import 'screen/dayofweek_screen.dart';
import 'screen/editprofile_screen.dart';
import 'screen/fram_screen.dart';
import 'screen/landing_screen.dart';
import 'screen/listofposts_screen.dart';
import 'screen/login/email/email_login_screen.dart';
import 'screen/login/email/signup_email_screen.dart';
import 'screen/login/email/email_resetpassword_screen.dart';
import 'screen/login/login_screen.dart';
import 'screen/mainhome_screen.dart';
import 'screen/personal_screen.dart';
import 'screen/post/post_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _articleNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'articleTab');
final GlobalKey<NavigatorState> _homeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'homeTab');
final GlobalKey<NavigatorState> _settingsTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'settingTab');
final GlobalKey<NavigatorState> _loginTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'loginTab');

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
              path: '/mainhome',
              builder: (context, state) {
                return MainhomeScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'post_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    return PostScreen();
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
              path: '/dayofweek',
              builder: (context, state) {
                return DayofweekScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'post_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    return PostScreen();
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
              path: '/login',
              builder: (context, state) {
                return LoginScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'email_login',
                  builder: (BuildContext context, GoRouterState state) {
                    return EmailLoginScreen();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'signup_email',
                      builder: (BuildContext context, GoRouterState state) {
                        return SignUpEmailScreen();
                      },
                    ),
                    GoRoute(
                      path: 'email_resetpassword',
                      builder: (context, state) {
                        return EmailResetpasswordScreen();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _loginTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/personal',
              builder: (BuildContext context, GoRouterState state) {
                return PersonalScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'postwriting',
                  builder: (BuildContext context, GoRouterState state) {
                      return PostwritingScreen();
                    }
                ),
                GoRoute(
                  path: 'listofposts',
                  builder: (BuildContext context, GoRouterState state) {
                    return ListofPostsScreen();
                  },
                ),
                GoRoute(
                  path: 'editprofile',
                  builder: (BuildContext context, GoRouterState state) {
                    return EditProfileScreen();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],

  redirect: (context, state) {
    final loginBloc = context.read<LoginBloc>();
    final currentState = loginBloc.state;

    if (currentState is LoginAuthenticatedState &&
        state.uri.path.contains('/personal/editprofile/')) {
      return '/login';
    } else if (currentState is LoginAuthenticatedState &&
        state.uri.path.contains('/login')) {
      return '/personal';
    }
  },
);
