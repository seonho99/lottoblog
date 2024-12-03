sealed class EmailResetPasswordEvent {}

final class ResetPasswordEmail extends EmailResetPasswordEvent {
  final String email;

  ResetPasswordEmail(this.email);
}