sealed class AuthEvent {
  const AuthEvent();
}

// 처음 구동했을 때
final class AppStarted extends AuthEvent{}

// 로그인 했을 때
final class SignInWithEmail extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmail(this.email, this.password);
}

// 로그아웃 했을 때
final class SignOut extends AuthEvent {}