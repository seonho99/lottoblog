import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_event.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_state.dart';
import 'package:lottoblog/data/repository/post_repository.dart';
import 'package:lottoblog/service/firebase_auth_service.dart';

class ReadPostsBloc extends Bloc<ReadPostsEvent, ReadPostsState> {
  final PostRepository postRepository;

  ReadPostsBloc(this.postRepository) : super(ReadPostsInitial()) {
    on<FetchAllPostsEvent>((event, emit) async {
      try {
        final readAllPosts = await postRepository.readAllPosts();

        emit(ReadAllPostsState(readAllPosts));
      } catch (e) {
        emit(ReadPostsFailure(errorMessage: e.toString()));
      }
    });

    on<LikePostEvent>((event, emit) async {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          emit(ReadPostsFailure(errorMessage: '로그인이 필요합니다.'));
          return;
        }
        final currentState = state;
        if (currentState is ReadAllPostsState) {
          emit(LikePostLoading(readAllPosts: currentState.readAllPosts));

          final updatedPost = await postRepository.likePost(
            postId: event.postId,
            likePostUid: event.likePostUid,
            uid: event.uid,
            userLikePost: event.userLikePost,
          );

          if(updatedPost != null){
            final updatedPosts = currentState.readAllPosts.map((post) {
              return post.postId == event.postId ? updatedPost : post;
            }).toList();
            emit(PostUpdatedState(readAllPosts: updatedPosts, updatedPost: updatedPost));
          } else {
            emit(ReadPostsFailure(errorMessage: '좋아요 업데이트 실패'));
          }
        }
      } catch (e) {
        emit(ReadPostsFailure(errorMessage: e.toString()));
      }
    });
  }
}
