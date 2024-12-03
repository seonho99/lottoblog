sealed class SignInState {}

final class SignInInitialState extends SignInState {}

final class SignInAuthenticatedState extends SignInState {
  final String uid;

  SignInAuthenticatedState(this.uid);
}

final class SignInUnAuthenticatedState extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInErrorState extends SignInState {
  final String message;

  SignInErrorState(this.message);
}
