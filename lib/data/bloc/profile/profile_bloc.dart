import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/repository/user_repo.dart';
import 'package:lottoblog/models/user_model.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepo userRepo;

  ProfileBloc(this.userRepo) : super(ProfileInitial()) {
    on<UpdateProfileEvent>((event, emit) async {
      try {
        UserModel? userModel = await userRepo.fetchProfile(uid: event.uid);
        if (userModel != null) {
          // print('userName: ${userModel.userName}');
          // print('profileImageUrl: ${userModel.profileImageUrl}');

          emit(ProfileUpdated(userModel.userName, userModel.profileImageUrl));
        }
      } catch (e) {
        ProfileFailure(errorMessage: e.toString());
      }
    });

  }
}