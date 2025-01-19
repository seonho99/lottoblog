import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginState {
  final User? user;

  LoginState({this.user});
}


final class LoginAuthenticated extends LoginState {
  final String uid;

  LoginAuthenticated(User user,{required this.uid}) : super(user:user);
}

final class LoginUnAuthenticated extends LoginState {

  LoginUnAuthenticated(): super(user : null);
}

// final class GetUid extends LoginState {
//   final String uid;
//
//   GetUid({required this.uid});
// }

final class LoginError extends LoginState {
  final String message;


  LoginError(this.message);
}
