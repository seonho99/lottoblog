import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/profile/profile_state.dart';
import 'package:lottoblog/data/repository/post_repository.dart';
import 'package:lottoblog/data/repository/user_repo.dart';
import 'package:lottoblog/models/user_model.dart';

import 'post_user_event.dart';
import 'post_user_state.dart';


class PostUserBloc extends Bloc<PostUserEvent,PostUserState>{
  UserRepo userRepo;
  // PostRepository postRepository;

  PostUserBloc(this.userRepo) : super(PostUserInitial()){
    on<UpdateUserEvent>((event, emit) async {
      try {
        List<UserModel> uid = await userRepo.fetchPostScreenUid(event.uid);
        emit(PostUserUpdated(uid));
      } catch (e){
        PostUserFailure(errorMessage: e.toString());
      }
    });
  }
}