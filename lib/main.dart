import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/router.dart';

import 'data/bloc/auth/auth_bloc.dart';
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
  final AuthBloc authBloc;

   MyApp({
    super.key,
    AuthRepository? authRepository,
    AuthBloc? authBloc,
  })  : authRepository = authRepository ?? AuthRepository(FirebaseAuthService()),
        authBloc = authBloc ?? AuthBloc(AuthRepository(FirebaseAuthService()));

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => authRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => authBloc,
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
