sealed class AuthEvent {}

final class AppStarted extends AuthEvent{}

final class SignInWithEmail extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmail(this.email, this.password);
}

final class SignOut extends AuthEvent {}