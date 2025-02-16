import '../../../models/user_model.dart';

sealed class PostUserState {
  UserModel? user;

  PostUserState({required this.user});
}

final class PostUserInitial extends PostUserState {
  PostUserInitial() : super(user: null);
}

final class PostUserUpdated extends PostUserState {
  PostUserUpdated(UserModel user) : super(user: user);
}

final class PostUserFailure extends PostUserState {
  final String errorMessage;

  PostUserFailure({required this.errorMessage}) : super(user: null);
}
