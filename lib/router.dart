import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/post_user/post_user_state.dart';
import 'package:lottoblog/screen/my_post_screen/my_post_screen.dart';
import 'package:lottoblog/screen/my_post_screen/post_update_screen.dart';
import 'package:lottoblog/screen/post_writing_screen.dart';

import 'data/bloc/login/login_bloc.dart';
import 'data/bloc/login/login_state.dart';

import 'screen/like_post/like_post_screen.dart';
import 'screen/edit_profile_screen.dart';
import 'screen/frame_screen.dart';
import 'screen/landing_screen.dart';
import 'screen/login/email/email_login_screen.dart';
import 'screen/login/email/signup_email_screen.dart';
import 'screen/login/email/email_resetpassword_screen.dart';
import 'screen/login/login_screen.dart';
import 'screen/home/mainhome_screen.dart';
import 'screen/personal/personal_screen.dart';
import 'screen/post_screen/post_screen.dart';

final GlobalKey<NavigatorState> _rootTabNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _mainTabNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _homeTabNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _loginTabNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _personalTabNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootTabNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => LandingScreen(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _rootTabNavigatorKey,
      builder: (context, state, navigationShell) {
        return FrameScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _mainTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/mainhome',
              builder: (context, state) {
                return MainhomeScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: '/post/:postId',
                  builder: (context, state) {
                    final postId = state.uri.pathSegments.last;
                    // final uid = state.uri.pathSegments.last;
                    return PostScreen(
                      postId: postId,
                      // uid: uid,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: '/likePosts',
              builder: (context, state) {
                return LikePostScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: '/post/:postId',
                  builder: (context, state) {
                    final postId = state.uri.pathSegments.last;
                    // final uid = state.uri.pathSegments.last;
                    return PostScreen(
                      postId: postId,
                      // uid: uid,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _loginTabNavigatorKey,
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
          navigatorKey: _personalTabNavigatorKey,
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
                    return PostWritingScreen();
                  },
                ),
                GoRoute(
                  path: 'editprofile',
                  builder: (BuildContext context, GoRouterState state) {
                    return EditProfileScreen();
                  },
                ),
                GoRoute(
                  path: '/post/:postId',
                  builder: (context, state) {
                    final postId = state.uri.pathSegments.last;
                    return MyPostScreen(
                      postId: postId,
                    );
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'update_post',
                      builder: (context, state) {
                        final postId = state.pathParameters['postId']!;
                        if(postId != null){
                        return PostUpdateScreen(postId: postId);
                        }
                        else {
                          return Scaffold(
                            appBar: AppBar(title: Text('Error')),
                            body: Center(child: Text('Post ID is missing')),
                          );
                        }
                      },
                    ),
                  ],
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

    if (currentState is LoginAuthenticated &&
        state.uri.path.contains('/personal/editprofile/')) {
      return '/login';
    } else if (currentState is LoginAuthenticated &&
        state.uri.path.contains('/login')) {
      return '/personal';
    }
  },
);
