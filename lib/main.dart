import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/email_reset_password/email_reset_password_bloc.dart';
import 'package:lottoblog/data/bloc/post/post_bloc.dart';
import 'package:lottoblog/data/bloc/signup/signup_bloc.dart';
import 'package:lottoblog/data/repository/post_repository.dart';
import 'package:lottoblog/router.dart';

import 'data/bloc/login/login_bloc.dart';
import 'data/repository/auth_repository.dart';
import 'service/firebase_auth_service.dart';
import 'service/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final LoginBloc loginBloc;
  final SignUpBloc signUpBloc;
  final EmailResetPasswordBloc emailResetPasswordBloc;
  final PostRepository postRepository;
  final PostBloc postBloc;

  MyApp({
    super.key,
    AuthRepository? authRepository,
    LoginBloc? loginBloc,
    SignUpBloc? signUpBloc,
    EmailResetPasswordBloc? emailResetPasswordBloc,
    PostRepository? postRepository,
    PostBloc? postBloc,
  })  : authRepository =
      authRepository ?? AuthRepository(FirebaseAuthService()),
        loginBloc = loginBloc ??
            LoginBloc(authRepository ?? AuthRepository(FirebaseAuthService())),
        signUpBloc = signUpBloc ??
            SignUpBloc(authRepository ?? AuthRepository(FirebaseAuthService())),
        emailResetPasswordBloc = emailResetPasswordBloc ??
            EmailResetPasswordBloc(authRepository ?? AuthRepository(FirebaseAuthService())), // 수정
        postRepository = postRepository ?? PostRepository(FireStoreService()),
        postBloc = postBloc ??
            PostBloc(postRepository ?? PostRepository(FireStoreService()));

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => loginBloc,
          ),
          BlocProvider<SignUpBloc>(
            create: (context) => signUpBloc,
          ),
          BlocProvider<EmailResetPasswordBloc>(
            create: (context) => emailResetPasswordBloc,
          ),
          BlocProvider<PostBloc>(
            create: (context) => postBloc,
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
