import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitialState()) {

    on<LoadPost>((event, emit) async {

        List<PostModel> postModel = await postRepository.fetchAllPosts(event.uid);
        await Future.delayed(Duration(seconds: 2));
        emit(PostLoaded(postModel));

    });

    on<AddPost>((event, emit) async {
      try {
        await postRepository.addPost(event.postModel);
        List<PostModel> updatedPosts = await postRepository.fetchAllPosts();
        emit(PostLoaded(updatedPosts));
      } catch (e) {
        emit(PostInitialState());
      }
    });

    on<UpdatePost>((event, emit) async {
      try {
        PostModel updatedPost = PostModel(
          postId: event.postId,
          title: event.title,
          content: event.content,
          imageUrls: event.imageUrls,
          createdAt: DateTime.now(),
        );
        await postRepository.updatePost(updatedPost);

        List<PostModel> updatedPosts = await postRepository.fetchAllPosts();
        emit(PostLoaded(updatedPosts));
      } catch (e) {
        emit(PostInitialState());
      }
    });

    on<DeletePost>((event, emit) async {
      try {
        await postRepository.deletePost(event.postId);

        List<PostModel> updatedPosts = await postRepository.fetchAllPosts();
        emit(PostLoaded(updatedPosts));
      } catch (e) {
        emit(PostInitialState());
      }
    });
  }
}
