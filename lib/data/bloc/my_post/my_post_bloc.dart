import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/my_post/my_post_event.dart';
import 'package:lottoblog/data/bloc/my_post/my_post_state.dart';
import 'package:lottoblog/data/repository/auth_repository.dart';
import 'package:lottoblog/data/repository/post_repository.dart';

class MyPostBloc extends Bloc<MyPostEvent,MyPostState>{
  final PostRepository postRepository;
  final AuthRepository authRepository;

  MyPostBloc(this.postRepository, this.authRepository) : super(MyPostInitial()){
    on<FetchMyPostsEvent>((event,emit) async{
      try {
        final myPosts = await postRepository.fetchUserPosts();
        emit(MyPostSuccess(myPosts));
      } catch (e) {
       emit(MyPostFailure(errorMessage: e.toString()));
      }
    });

    on<MyLikeCountEvent>((event,emit) async {
      // String? uid = await authRepository.getUid();

      try {
        await postRepository.likePostCount(postId: event.postId);
      } catch (e){
        emit(MyPostSuccess(state.myPosts));
      }
    });
  }
}


