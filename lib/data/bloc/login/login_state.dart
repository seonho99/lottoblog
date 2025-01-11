import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginState {
  final User? user;
  final bool isLoggedIn;

  LoginState({this.user, this.isLoggedIn = false});
}


final class LoginAuthenticated extends LoginState {
  final String uid;

  LoginAuthenticated(User user)
      : uid = user.uid,
        super(user: user, isLoggedIn: true);
}

final class LoginUnAuthenticated extends LoginState {}


final class LoginErrorState extends LoginState {
  final String message;

  LoginErrorState(this.message);
}
