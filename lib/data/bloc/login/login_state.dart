import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginState {
  User? user;

  LoginState(this.user);
}

class LoginUnAuthenticated extends LoginState{

  LoginUnAuthenticated() : super(null);
}

class LoginAuthenticated extends LoginState {

  LoginAuthenticated(User user) : super(user);
}


class LoginFailure extends LoginState {
  String message;

  LoginFailure(this.message) : super(null);
}
