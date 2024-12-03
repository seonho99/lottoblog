sealed class SignInEvent {}

final class SignInWithEmail extends SignInEvent {
  final String email;
  final String password;

  SignInWithEmail(this.email, this.password);
}
