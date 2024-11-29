import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/models/post_model.dart';
import 'post_event.dart';
import 'post_state.dart';
import '../../repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostInitialState()) {

    on<PostContentChangedEvent>((event, emit) {
      emit(PostContentChangedState(
        title: event.title,
        content: event.content,
        imageUrls: event.imageUrls,
      ));
    });

    on<PostSubmittedEvent>((event, emit) async {
      try {
        final userId = await _postRepository.getUserId();

        if (userId.isEmpty) {
          emit(PostErrorState('사용자가 로그인되지 않았습니다.'));
          return;
        }

        final postModel = PostModel(
          title: event.postModel.title,
          content: event.postModel.content,
          uid: userId,
          imageUrls: event.postModel.imageUrls,
          createdAt: DateTime.now(),
        );

        await _postRepository.createPost(postModel);

        emit(PostSubmittedState(postModel)); // 성공 상태로 변경
      } catch (e) {
        emit(PostErrorState('게시글 제출에 실패했습니다.'));
      }
    });
  }
}
