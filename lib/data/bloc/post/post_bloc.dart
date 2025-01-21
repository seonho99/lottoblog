import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/repository/auth_repository.dart';

import '../../repository/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {

  // String? getUid(){
  //   return authRepository.getUid();
  // }

  // String? getPostId(){
  //   return postRepository.getPostId();
  // }

  final PostRepository postRepository;
  final AuthRepository authRepository;

  PostBloc(this.postRepository, this.authRepository) : super(PostInitial()) {
    // on<CreatePost>((event, emit) async {
    //   List<PostModel> posts = state.posts;
    //   postRepository.createPost(event.posts);
    //   posts.add(event.posts);
    //   emit(PostLoaded(posts));
    // });

    on<CreatePost>((event, emit) async {
      try {
        await postRepository.createPost(event.posts);
        emit(PostsLoaded(state.myPosts));
      } catch(e) {
        emit(PostFailure(errorMessage: e.toString()));
      }
    });



    // on<ReadPost>((event, emit) async {
    //   try {
    //     final posts = await postRepository.readPost(event.postId);
    //     emit(PostLoaded([posts]));
    //   } catch (e) {
    //     emit(PostFailure(errorMessage: e.toString()));
    //   }
    // });

    // on<ReadAllPosts>((event, emit) async {
    //   try {
    //     final postLists = await postRepository.readAllPosts(postId: event.postId,limit: event.limit,lastPosts: event.lastPosts);
    //     emit(PostLoaded(postLists));
    //   } catch (e) {
    //     emit(PostFailure(errorMessage: e.toString()));
    //   }
    // });

    on<FetchMyPosts>((event, emit) async {
      try {
        final myPosts = await postRepository.fetchUserPosts();

        emit(MyPosts(myPosts));
      } catch (e) {
        emit(PostFailure(errorMessage: e.toString()));
      }
    });



    // on<UpdatePost>((event, emit) async {
    //   List<PostModel> postLists = await postRepository.updatePost(postmodel);
    //   emit(PostLoaded(postLists));
    // });

    // on<DeletePost>((event, emit) async {
    //   List<PostModel> postLists = state.posts;
    //   postRepository.deletePost(event.postId);
    //   emit(PostLoaded(postLists));
    // });
  }
}
