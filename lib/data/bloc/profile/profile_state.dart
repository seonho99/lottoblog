import 'package:lottoblog/models/user_model.dart';

sealed class ProfileState{
  String userName;
  String profileImageUrl;

  ProfileState({required this.userName,required this.profileImageUrl});
}

final class ProfileInitial extends ProfileState{

  ProfileInitial() : super(userName: '',profileImageUrl: '');
}

final class ProfileUpdated extends ProfileState{
  ProfileUpdated(String userName,String profileImageUrl) :
  super(userName: userName,profileImageUrl: profileImageUrl);
}

final class ProfileFailure extends ProfileState{
  final String errorMessage;
  ProfileFailure({required this.errorMessage}):
  super(userName: '',profileImageUrl: '');
}


