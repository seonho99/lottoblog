import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/post_model.dart';
import '../../repository/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {

    on<LoadPost>((event, emit) async {
      List<PostModel> postLists = await postRepository.fetchAllPosts(uid: event.uid);
      await Future.delayed(Duration(seconds: 2));
      emit(PostLoaded(postLists));
    });

    on<CreatePost>((event, emit) async {
      List<PostModel> postLists = state.postmodel;
      postRepository.createPost(event.postmodel);
      postLists.add(event.postmodel);
      emit(PostLoaded(postLists));
    });

    on<UpdatePost>((event, emit) async {
      List<PostModel> postLists = state.postmodel;
      int index = int.parse(event.postId);
      postRepository.updatePost(postLists[index]);
      emit(PostLoaded(postLists));
    });

    on<DeletePost>((event, emit) async {
      List<PostModel> postLists = state.postmodel;
      postRepository.deletePost(event.postId);
      emit(PostLoaded(postLists));

    });
  }
}
