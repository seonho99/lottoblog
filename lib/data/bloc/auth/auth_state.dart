import 'package:firebase_auth/firebase_auth.dart';

sealed class AuthState{}

// 초기상태
final class AuthInitialState extends AuthState {}

// 로그인 상태
final class AuthAuthenticatedState extends AuthState {
  final User user;

  AuthAuthenticatedState(this.user);
}

// 로그아웃 상태
final class AuthUnauthenticatedState extends AuthState{}

// 에러 상태
final class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState(this.message);
}