import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_event.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_state.dart';
import 'package:lottoblog/data/repository/auth_repository.dart';
import 'package:lottoblog/data/repository/post_repository.dart';

class ReadPostsBloc extends Bloc<ReadPostsEvent, ReadPostsState> {
  final PostRepository postRepository;
  final AuthRepository authRepository;

  ReadPostsBloc(this.postRepository, this.authRepository)
      : super(ReadPostsInitial()) {
    on<FetchAllPostsEvent>((event, emit) async {
      try {
        // final readAllPosts = await postRepository.readAllPosts();
        // emit(ReadAllPostsState(readAllPosts));
        final fetchSafePosts = await postRepository.fetchSafePosts();
        emit(ReadAllPostsSuccess(fetchSafePosts));
      } catch (e) {
        emit(ReadPostsFailure(errorMessage: e.toString()));
      }
    });


    on<LikePostEvent>((event, emit) async {
      String? uid = await authRepository.getUid();

      try {
        if (uid == null) throw Exception('login 필요');
        //db update
        await postRepository.likePostUid(postId: event.postId, uid: uid);
        for (var element in state.readAllPosts) {
          if (element.postId == event.postId) {
            if (element.likePostUid.contains(uid)) {
              element.likePostUid.remove(uid);
              element.likePostCount--;
            } else {
              element.likePostUid.add(uid);
              element.likePostCount++;
            }
          }
        }
        emit(ReadAllPostsSuccess(state.readAllPosts));
      } catch (e) {
        emit(ReadPostsFailure(errorMessage: "좋아요 업데이트 실패: $e"));
      }
    });

    on<ReportPostEvent>((event, emit) async {
      try {
        await postRepository.reportPost(event.postId);
        final updatedPosts = await postRepository.fetchSafePosts();
        emit(ReadAllPostsSuccess(updatedPosts));
      } catch (e) {
        emit(ReadPostsFailure(errorMessage: "좋아요 업데이트 실패: $e"));
      }
    });

    on<DeletePostEvent>((event, emit) async{
      try {
        await postRepository.deletePost(postId: event.postId);
        emit(ReadAllPostsSuccess([]));
      } catch (e){
        emit(ReadPostsFailure(errorMessage: "post 삭제 실패: $e"));
      }
    });
  }
}
