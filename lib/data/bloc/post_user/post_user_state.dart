import '../../../models/user_model.dart';

sealed class PostUserState {
  List<UserModel> user;

  PostUserState({required this.user});
}

final class PostUserInitial extends PostUserState {
  PostUserInitial() : super(user: []);
}

final class PostUserUpdated extends PostUserState {
  PostUserUpdated(List<UserModel> user) : super(user: user);
}

final class PostUserFailure extends PostUserState {
  final String errorMessage;

  PostUserFailure({required this.errorMessage}) : super(user: []);
}
