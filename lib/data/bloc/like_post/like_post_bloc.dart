import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/like_post/like_post_event.dart';
import 'package:lottoblog/data/bloc/like_post/like_post_state.dart';
import 'package:lottoblog/data/repository/post_repository.dart';

class LikePostBloc extends Bloc<LikePostEvent, LikePostState>{
  final PostRepository postRepository;

  LikePostBloc(this.postRepository) :super(LikePostsInitial()){
   on<LikeAllPostsEvent>((event, emit) async {
     final likeAllPosts = await postRepository.likeAllPosts();
     emit(LikePostsSuccess(likeAllPosts));
   });
  }
}




