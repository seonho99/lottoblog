import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/repository/post_repository.dart';

import '../../../models/post_model.dart';
import 'post_screen_event.dart';
import 'post_screen_state.dart';


class PostScreenBloc extends Bloc<PostScreenEvent,PostScreenState> {
  PostRepository postRepository;

  PostScreenBloc(this.postRepository) : super(PostScreenInitial()){
    on<FetchPost>((event, emit) async {
      try {
        List<PostModel> posts = await postRepository.fetchPostId(event.postId);
        emit(PostScreenSuccess(posts));
      } catch (e) {
        emit(PostScreenFailure(errorMessage: e.toString()));
      }
    });
  }
}