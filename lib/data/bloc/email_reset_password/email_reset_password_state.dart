sealed class EmailResetPasswordState {}

final class EmailResetPasswordInital extends EmailResetPasswordState{}

final class EmailResetPasswordLoading extends EmailResetPasswordState{}

final class EmailResetPasswordSuccess extends EmailResetPasswordState{
  final String message;

  EmailResetPasswordSuccess(this.message);
}

final class EmailResetPasswordError extends EmailResetPasswordState{
  final String message;

  EmailResetPasswordError(this.message);
}
