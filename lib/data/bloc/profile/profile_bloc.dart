import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/repository/user_repo.dart';

import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepo userRepo;

  ProfileBloc(this.userRepo) : super(ProfileInitial()) {
    on<UpdateProfileEvent>((event, emit) async {
      try {
        await userRepo.fetchProfile(uid: event.uid);
      }catch(e){
        ProfileFailure(errorMessage: e.toString());
      }

    });
  }
}
