sealed class AuthEvent {
  const AuthEvent();
}

// 앱 시작 시
final class AppStarted extends AuthEvent{}

// 로그인
final class SignInWithEmail extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmail(this.email, this.password);
}

// 로그아웃
final class SignOut extends AuthEvent {}

// 비밀번호 재설정
final class ResetPassword extends AuthEvent{
  final String email;

  ResetPassword(this.email);
}

final class DeleteAccount extends AuthEvent{}
