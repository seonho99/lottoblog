import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginState {
  final User? user;
  final bool isLoggedIn;

  LoginState({this.user, this.isLoggedIn = false});
}

final class LoginInitialState extends LoginState {}

final class LoginAuthenticatedState extends LoginState {
  final String uid;

  LoginAuthenticatedState(this.uid);
}

final class LoginUnAuthenticatedState extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
}
