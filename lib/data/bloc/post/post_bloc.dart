import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/post_model.dart';
import '../../repository/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {

    on<LoadPost>((event, emit) async {
      List<PostModel> postmodel = await postRepository.fetchAllPosts(uid: event.uid);
      await Future.delayed(Duration(seconds: 2));
      emit(PostLoaded(postmodel));
    });

    on<CreatePost>((event, emit) async {
      List<PostModel> postmodel = state.postmodel;
      postRepository.createPost(event.postmodel);
      postmodel.add(event.postmodel);
      emit(PostLoaded(postmodel));
    });

    on<UpdatePost>((event, emit) async {
      List<PostModel> postmodel = state.postmodel;
      postRepository.updatePost(postmodel[event.postId]);
      emit(PostLoaded(postmodel));
    });

    on<DeletePost>((event, emit) async {});
  }


}
