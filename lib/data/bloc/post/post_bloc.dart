import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/repository/auth_repository.dart';

import '../../../models/post_model.dart';
import '../../repository/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {

  String? getUid(){
    return authRepository.getUid();
  }

  final PostRepository postRepository;
  final AuthRepository authRepository;

  PostBloc(this.postRepository, this.authRepository) : super(PostInitial()) {



    on<FetchMyPosts>((event, emit) async {
      try {
        final posts = await postRepository.fetchAllPosts(uid: event.uid);
        emit(PostLoaded(posts));
      } catch (e){
        emit(PostFailure(errorMessage: e.toString()));
      }
    });

    on<CreatePost>((event, emit) async {
      List<PostModel> posts = state.posts;
      postRepository.createPost(event.posts);
      posts.add(event.posts);
      emit(PostLoaded(posts));
    });

    on<ReadPost>((event, emit) async {
      try {
        final posts = await postRepository.readPost(event.postId);
        emit(PostLoaded([posts]));
      } catch (e) {
        emit(PostFailure(errorMessage: e.toString()));
      }
    });

    on<ReadAllPosts>((event, emit) async {
      try {
        final postLists = await postRepository.readAllPosts();
        emit(PostLoaded(postLists));
      } catch (e) {
        emit(PostFailure(errorMessage: e.toString()));
      }
    });

    // on<UpdatePost>((event, emit) async {
    //   List<PostModel> postLists = await postRepository.updatePost(postmodel);
    //   emit(PostLoaded(postLists));
    // });

    on<DeletePost>((event, emit) async {
      List<PostModel> postLists = state.posts;
      postRepository.deletePost(event.postId);
      emit(PostLoaded(postLists));
    });
  }
}
