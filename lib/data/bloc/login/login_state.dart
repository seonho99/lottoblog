import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginState {
  final User? user;
  final bool isLoggedIn;

  LoginState({this.user, this.isLoggedIn = false});
}


final class LoginAuthenticated extends LoginState {

  LoginAuthenticated(User user) : super(user: user, isLoggedIn: true);
}

final class LoginUnAuthenticated extends LoginState {

  LoginUnAuthenticated(): super(user : null, isLoggedIn: false);
}


final class LoginError extends LoginState {
  final String message;


  LoginError(this.message);
}
