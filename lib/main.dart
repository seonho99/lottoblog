import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/like_post/like_post_bloc.dart';
import 'package:lottoblog/data/bloc/login/login_bloc.dart';
import 'package:lottoblog/data/bloc/my_post/my_post_bloc.dart';
import 'package:lottoblog/data/bloc/post/post_bloc.dart';
import 'package:lottoblog/data/bloc/post_screen/post_screen_bloc.dart';
import 'package:lottoblog/data/bloc/post_user/post_user_bloc.dart';
import 'package:lottoblog/data/bloc/profile/profile_bloc.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_bloc.dart';
import 'package:lottoblog/data/bloc/tab_navigation/tab_navigation_bloc.dart';
import 'package:lottoblog/data/repository/auth_repository.dart';
import 'package:lottoblog/data/repository/post_repository.dart';
import 'package:lottoblog/data/repository/user_repo.dart';
import 'package:lottoblog/router.dart';
import 'package:lottoblog/service/firestore_service.dart';

import 'service/firebase_auth_service.dart';
import 'service/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final PostRepository postRepository;
  final UserRepo userRepo;

  final LoginBloc loginBloc;
  // final EmailResetPasswordBloc emailResetPasswordBloc;
  final PostBloc postBloc;
  final ReadPostsBloc readPostsBloc;
  final TabNavigationBloc tabNavigationBloc;
  final MyPostBloc myPostBloc;
  final ProfileBloc profileBloc;
  final PostScreenBloc postScreenBloc;
  final PostUserBloc postUserBloc;
  final LikePostBloc likePostBloc;

  MyApp({
    super.key,
    AuthRepository? authRepository,
    PostRepository? postRepository,
    UserRepo? userRepo,
    LoginBloc? loginBloc,
    // EmailResetPasswordBloc? emailResetPasswordBloc,
    PostBloc? postBloc,
    ReadPostsBloc? readPostsBloc,
    TabNavigationBloc? tabNavigationBloc,
    MyPostBloc? myPostBloc,
    ProfileBloc? profileBloc,
    PostScreenBloc? postScreenBloc,
    PostUserBloc? postUserBloc,
    LikePostBloc? likePostBloc,
  })  : authRepository =
            authRepository ?? AuthRepository(FirebaseAuthService()),
        postBloc = postBloc ??
            PostBloc(postRepository ?? PostRepository(FirestoreService()),
                authRepository ?? AuthRepository(FirebaseAuthService())),
        userRepo = userRepo ?? UserRepo(FirestoreService()),
        loginBloc = loginBloc ??
            LoginBloc(authRepository ?? AuthRepository(FirebaseAuthService())),
        // emailResetPasswordBloc = emailResetPasswordBloc ??
        //     EmailResetPasswordBloc(
        //         authRepository ?? AuthRepository(FirebaseAuthService())),
        postRepository = postRepository ?? PostRepository(FirestoreService()),
        readPostsBloc = readPostsBloc ??
            ReadPostsBloc(postRepository ?? PostRepository(FirestoreService()),
                AuthRepository(FirebaseAuthService())),
        tabNavigationBloc = TabNavigationBloc(),
        myPostBloc = myPostBloc ??
            MyPostBloc(postRepository ?? PostRepository(FirestoreService()),
                authRepository ?? AuthRepository(FirebaseAuthService())),
        profileBloc = profileBloc ??
            ProfileBloc(userRepo ?? UserRepo(FirestoreService())),
        postScreenBloc = postScreenBloc ??
            PostScreenBloc(
                postRepository ?? PostRepository(FirestoreService())),
        postUserBloc = postUserBloc ??
            PostUserBloc(userRepo ?? UserRepo(FirestoreService())),
        likePostBloc = likePostBloc ??
            LikePostBloc(postRepository ?? PostRepository(FirestoreService()));

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => authRepository,
        ),
        RepositoryProvider<PostRepository>(
          create: (context) => postRepository,
        ),
        RepositoryProvider<UserRepo>(
          create: (context) => userRepo,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => loginBloc,
          ),
          // BlocProvider<EmailResetPasswordBloc>(
          //   create: (context) => emailResetPasswordBloc,
          // ),
          BlocProvider<PostBloc>(
            create: (context) => postBloc,
          ),
          BlocProvider<ReadPostsBloc>(
            create: (context) => readPostsBloc,
          ),
          BlocProvider<TabNavigationBloc>(
            create: (context) => tabNavigationBloc,
          ),
          BlocProvider<MyPostBloc>(
            create: (context) => myPostBloc,
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => profileBloc,
          ),
          BlocProvider<PostScreenBloc>(
            create: (context) => postScreenBloc,
          ),
          BlocProvider<PostUserBloc>(
            create: (context) => postUserBloc,
          ),
          BlocProvider<LikePostBloc>(
            create: (context) => likePostBloc,
          ),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          title: 'Lotto Blog',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'NanumSquareNeo',
            textTheme: const TextTheme(
              titleSmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              titleMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              titleLarge: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              headlineSmall: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              headlineMedium: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
              headlineLarge: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
              displaySmall: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.normal,
              ),
              displayMedium: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
              ),
              displayLarge: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
