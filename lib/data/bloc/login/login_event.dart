sealed class LoginEvent {
  const LoginEvent();
}

final class LoginWithEmail extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmail(this.email, this.password);
}

class Logout extends LoginEvent {}

