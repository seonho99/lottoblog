import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/models/post_model.dart';

import '../../repository/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(PostInitialState()) {
    on<LoadPost>(_onLoadPostEvent);
    on<AddPost>(_onAddPostEvent);
    on<UpdatePost>(_onUpdatePostEvent);
    on<DeletePost>(_onDeletePostEvent);
  }

  Future<void> _onLoadPostEvent(LoadPost event, Emitter<PostState> emit) async {
    try {
      await postRepository.fetchAllPosts();
      emit(PostLoaded(postModel: postRepository.postmodel));
    } catch (e) {
      print('Error loading posts: $e');
    }
}

  Future<void> _onAddPostEvent(AddPost event, Emitter<PostState> emit) async {
    try {
      await postRepository.addPost(event.postModel);
      await postRepository.fetchAllPosts();
      emit(PostLoaded(postModel:postRepository.postmodel));
    } catch (e) {
      print('Error adding post: $e');
    }
  }

  Future<void> _onUpdatePostEvent(UpdatePost event, Emitter<PostState> emit) async {
    try {
      PostModel updatedPost = PostModel(
        postId: event.postId,
          title: event.title,
          content: event.content,
        imageUrls: event.imageUrls,
      );
      await postRepository.updatePost(updatedPost);
      await postRepository.fetchAllPosts();
      emit(PostLoaded(postModel: postRepository.postmodel));
    } catch (e) {
      print('Error updating post: $e');
    }
  }

  Future<void> _onDeletePostEvent(DeletePost event, Emitter<PostState> emit) async {
    try {
      await postRepository.deletePost(event.postId);
      await postRepository.fetchAllPosts();
      emit(PostLoaded(postModel: postRepository.postmodel));
    } catch (e) {
      print('Error deleting post: $e');
    }
  }

}
