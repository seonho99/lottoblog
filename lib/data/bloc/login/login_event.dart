sealed class LoginEvent {
  const LoginEvent();
}

final class LoginWithEmail extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmail(this.email, this.password);
}

final class SignUpEmail extends LoginEvent{
  final String email;
  final String password;

  SignUpEmail({required this.email, required this.password});
}

final class Logout extends LoginEvent {}

