import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/editprofile_screen.dart';
import 'package:lottoblog/email/emaillogin_screen.dart';
import 'package:lottoblog/email/emailregister_screen.dart';
import 'package:lottoblog/email/emailresetpassword_screen.dart';
import 'package:lottoblog/fram_screen.dart';
import 'package:lottoblog/listofposts_screen.dart';
import 'package:lottoblog/login_screen.dart';
import 'package:lottoblog/personal_screen.dart';
import 'package:lottoblog/post_screen/post_list_screen.dart';
import 'package:lottoblog/postwriting_screen.dart';
import 'landing_screen.dart';
import 'mainhome_screen.dart';
import 'post_screen/post_screen01.dart';
import 'dayofweek_screen.dart';

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
                return MainHomeScreen();
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
                return DayOfWeekScreen();
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
                  path: 'emaillogin',
                  builder: (BuildContext context, GoRouterState state) {
                    return EmailloginScreen();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'emailregister',
                      builder: (BuildContext context, GoRouterState state) {
                        return EmailregisterScreen();
                      },
                    ),
                    GoRoute(
                      path: 'emailresetpassword',
                      builder: (context, state) {
                        return EmailresetpasswordScreen();
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
                          builder: (BuildContext context, GoRouterState state){
                              return EditProfileScreen();
                          },
                        ),
                        GoRoute(
                            path: 'postwriting',
                            builder: (BuildContext context, GoRouterState state){
                              final String? userId = FirebaseAuth.instance.currentUser?.uid;
                              if (userId == null ){
                                return LoginScreen();
                              }
                              return PostwritingScreen(userId: userId);
                            },
                        ),
                        GoRoute(
                          path: 'listofposts',
                          builder: (BuildContext context, GoRouterState state){
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

      // 사용자가 로그인하지 않은 경우
      if (user == null && state.uri.path == '/login/emaillogin' &&
          state.uri.path == '/login/emaillogin/emailregister' &&
          state.uri.path == '/login/emaillogin/emailresetpassword') {
        return '/login'; // 로그인 화면으로 리디렉션
      }

      // 사용자가 로그인한 경우
      if (user != null && state.uri.path == '/login/emaillogin/personal') {
        return '/login/emaillogin/personal'; // 홈 화면으로 리디렉션
      }

      return null; // 기본 동작
    }
);
