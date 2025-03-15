import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/repository/auth_repository.dart';

import '../../repository/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;
  final AuthRepository authRepository;

  PostBloc(this.postRepository, this.authRepository) : super(PostInitial()) {
    on<CreatePost>((event, emit) async {
      try {
        await postRepository.createPost(event.posts);
      } catch (e) {
        emit(PostFailure(errorMessage: e.toString()));
      }
    });

    // on<UpdatePostEvent>((event, emit) async {
    //   try {
    //
    //   } catch {
    //
    //   }
    // });
  }
}
