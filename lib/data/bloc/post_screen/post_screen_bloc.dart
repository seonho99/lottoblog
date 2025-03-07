import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/repository/post_repository.dart';

import '../../../models/post_model.dart';
import 'post_screen_event.dart';
import 'post_screen_state.dart';

class PostScreenBloc extends Bloc<PostScreenEvent, PostScreenState> {
  PostRepository postRepository;

  PostScreenBloc(this.postRepository) : super(PostScreenInitial()) {
    on<FetchPostEvent>((event, emit) async {
      try {
        PostModel? fetchPost =
            await postRepository.fetchPostScreen(event.postId);
        emit(PostScreenSuccess(fetchPost));
      } catch (e) {
        emit(PostScreenFailure(errorMessage: e.toString()));
      }
    });

    on<DeleteImageUrlEvent>((event, emit) async {
      try {

      } catch (e) {
        emit(PostScreenFailure(errorMessage: e.toString()));
      }
    });

    on<UpdatePostEvent>((event, emit) async {
      try {

      } catch (e) {
        emit(PostScreenFailure(errorMessage: e.toString()));
      }
    });
  }
}
