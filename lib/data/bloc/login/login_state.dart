import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginState {
  User? user;

  LoginState({required this.user});
}

class LoginUnAuthenticated extends LoginState{

  LoginUnAuthenticated() : super(user: null);
}

class LoginAuthenticated extends LoginState {

  LoginAuthenticated(User user) : super(user:user);
}


class LoginFailure extends LoginState {
  String message;

  LoginFailure(this.message) : super(user: null);
}
