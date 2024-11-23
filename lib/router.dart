import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/dayofweek_screen.dart';
import 'screen/editprofile_screen.dart';

import 'screen/fram_screen.dart';
import 'screen/landing_screen.dart';
import 'screen/listofposts_screen.dart';
import 'screen/login/email/email_login_screen.dart';
import 'screen/login/email/email_register_screen.dart';
import 'screen/login/email/email_resetpassword_screen.dart';
import 'screen/login/login_screen.dart';
import 'screen/mainhome_screen.dart';
import 'screen/personal_screen.dart';
import 'screen/post/postlist_screen.dart';
import 'screen/post/post_screen01.dart';
import 'screen/postwriting_screen.dart';

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
                path: '/mainhome',
                builder: (context, state) {
                  return MainhomeScreen();
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'post_screen01',
                    builder: (BuildContext context, GoRouterState state) {
                      final String? postId = state.extra as String?;

                      if (postId == null) {
                        return LoginScreen(); // null일 경우 에러 화면
                      }

                      return PostListScreen(postId: postId);
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
                    path: 'post_screen01',
                    builder: (BuildContext context, GoRouterState state) {
                      return PostScreen01();
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
                        path: 'email_register',
                        builder: (BuildContext context, GoRouterState state) {
                          return EmailRegisterScreen();
                        },
                      ),
                      GoRoute(
                        path: 'email_resetpassword',
                        builder: (context, state) {
                          return EmailResetpasswordScreen();
                        },
                      ),
                      GoRoute(
                        path: 'personal',
                        builder: (BuildContext context, GoRouterState state) {
                          return PersonalScreen();
                        },
                        routes: <RouteBase>[
                          GoRoute(
                            path: 'editprofile',
                            builder:
                                (BuildContext context, GoRouterState state) {
                              return EditProfileScreen();
                            },
                          ),
                          GoRoute(
                            path: 'postwriting',
                            builder:
                                (BuildContext context, GoRouterState state) {
                              final String? userId =
                                  FirebaseAuth.instance.currentUser?.uid;
                              if (userId == null) {
                                return LoginScreen();
                              }
                              return PostwritingScreen(userId: userId);
                            },
                          ),
                          GoRoute(
                            path: 'listofposts',
                            builder:
                                (BuildContext context, GoRouterState state) {
                              return ListofpostsScreen();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ],
    redirect: (context, state) {
      User? user = FirebaseAuth.instance.currentUser;

      // 사용자가 로그인한 경우
      if (user != null && state.uri.path == '/login/email_login/personal') {
        return '/login/email_login/personal'; // 홈 화면으로 리디렉션
      }

      return null; // 기본 동작
    });
