import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../../repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostInitialState()) {
    on<PostContentChangedEvent>((event, emit) {
      emit(PostContentChangedState(event.content));
    });

    on<PostSubmittedEvent>((event, emit) async {
      try {
        await _postRepository.createPost(event.postModel);
        emit(PostSubmittedState(event.postModel));
      } catch (e) {
        emit(PostErrorState('게시글 제출에 실패했습니다.'));
      }
    });
  }
}