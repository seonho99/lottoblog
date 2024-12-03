sealed class SignUpEvent {}

final class SignUpWithEmail extends SignUpEvent {
  final String email;
  final String password;
  final String name;

  SignUpWithEmail({required this.email, required this.password, required this.name});
}
