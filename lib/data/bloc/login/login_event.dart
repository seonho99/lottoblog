sealed class LoginEvent {}


final class SignUpEmail extends LoginEvent{
  String email;
  String password;
  String name;

  SignUpEmail({required this.email, required this.password, required this.name});
}

final class LoginWithEmail extends LoginEvent {
  String email;
  String password;

  LoginWithEmail(this.email, this.password);
}

final class Logout extends LoginEvent {}

