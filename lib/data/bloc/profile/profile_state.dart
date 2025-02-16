import '../../../models/user_model.dart';

sealed class ProfileState {
  UserModel? user;

  ProfileState({required this.user});
}

final class ProfileInitial extends ProfileState {
  ProfileInitial() : super(user: null);
}

final class ProfileUpdated extends ProfileState {
  ProfileUpdated(UserModel user) : super(user: user);
}

final class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure({required this.errorMessage}) : super(user: null);
}
