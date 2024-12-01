import 'package:firebase_auth/firebase_auth.dart';

sealed class AuthState{
  const AuthState();
}

// 초기상태
final class AuthInitialState extends AuthState {}

// 인증
final class AuthAuthenticatedState extends AuthState {
  final String uid;

  AuthAuthenticatedState(this.uid);
}

// 인증 안됨
final class AuthUnauthenticatedState extends AuthState{}

// 에러 상태
final class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState(this.message);
}