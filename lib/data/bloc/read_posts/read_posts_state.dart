import '../../../models/post_model.dart';

sealed class ReadPostsState{
  final List<PostModel> readAllPosts;

  ReadPostsState({required this.readAllPosts});
}

final class ReadPostsInitial extends ReadPostsState{

  ReadPostsInitial() : super(readAllPosts: []);
}

// 공개 게시글 상태
final class ReadAllPostsSuccess extends ReadPostsState {

  ReadAllPostsSuccess(List<PostModel> readAllPosts) : super(readAllPosts : readAllPosts);
}


// 에러 상태
final class ReadPostsFailure extends ReadPostsState {
  final String errorMessage;

  ReadPostsFailure({required this.errorMessage}) : super (readAllPosts: []);
}