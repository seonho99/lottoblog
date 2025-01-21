import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_event.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_state.dart';
import 'package:lottoblog/data/repository/post_repository.dart';

class ReadPostsBloc extends Bloc<ReadPostsEvent, ReadPostsState> {
  final PostRepository postRepository;

  ReadPostsBloc(this.postRepository) : super (ReadPostsInitial()) {
    on<FetchAllPosts>((event, emit) async {
      try {
        final readAllPosts = await postRepository.readAllPosts();

        emit(ReadAllPosts(readAllPosts));
      } catch (e) {
        emit(ReadPostsFailure(errorMessage: e.toString()));
      }
    });
  }
}


