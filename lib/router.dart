import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/emaillogin_screen.dart';
import 'package:lottoblog/emailregister_screen.dart';
import 'package:lottoblog/fram_screen.dart';
import 'package:lottoblog/listofposts_screen.dart';
import 'package:lottoblog/login_screen.dart';
import 'package:lottoblog/personal_screen.dart';
import 'package:lottoblog/post_screen/post_list_screen.dart';
import 'package:lottoblog/postwriting_screen.dart';
import 'editprofile_screen.dart';
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
              path: '/mainhome_screen',
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
              path: '/dayofweek_screen',
              builder: (context, state) {
                return DayOfWeekScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'blogpost_screen01',
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
              path: '/login_screen',
              builder: (context, state) {
                return LoginScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'emaillogin_screen',
                  builder: (BuildContext context, GoRouterState state) {
                    return EmailloginScreen();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'emailregister_screen',
                      builder: (BuildContext context, GoRouterState state) {
                        return Emailregister_Screen();
                      },
                    ),
                  ],
                ),
              ],

            // GoRoute(
            //   path: '/personal_screen',
            //   builder: (context, state) {
            //     return PersonalScreen();
            //   },
            //   routes: <RouteBase>[
            //     GoRoute(
            //       path: 'editprofile_screen',
            //       builder: (BuildContext context, GoRouterState state) {
            //         return EditProfileScreen();
            //       },
            //     ),
            //     GoRoute(
            //       path: 'blogwriting_screen',
            //       builder: (BuildContext context, GoRouterState state) {
            //         return PostwritingScreen();
            //       },
            //     ),
            //     GoRoute(
            //       path: 'listofposts_screen',
            //       builder: (BuildContext context, GoRouterState state) {
            //         return ListofpostsScreen();
            //       },
            //     ),
            //   ],

              
            ),
          ],
        )
      ],
    ),
  ],
);

