import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_event.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_state.dart';
import 'package:lottoblog/data/repository/post_repository.dart';

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
        final currentState = state;
        if (currentState is ReadAllPostsState) {
          emit(LikePostLoading(readAllPosts:currentState.readAllPosts));

          final updatedPost = await postRepository.likeState(event.postId!);

          if(updatedPost != null){
            final updatedPosts = currentState.readAllPosts.map((post){
              return post.postId == event.postId ? updatedPost : post;
            }).toList();
            emit(PostUpdatedState(readAllPosts: updatedPosts, updatedPost: updatedPost));
          }
        }
      } catch (e) {
        emit(ReadPostsFailure(errorMessage: e.toString()));
      }
    });
  }
}
