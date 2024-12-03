sealed class LoginEvent {}

final class LoginWithEmail extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmail(this.email, this.password);
}

class LogoutEvent extends LoginEvent {}

