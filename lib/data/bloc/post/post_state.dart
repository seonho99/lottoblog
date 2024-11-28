import '../../../models/post_model.dart';

sealed class PostState {}

// 초기 상태
final class PostInitialState extends PostState {}

// 게시글 변경
final class PostContentChangedState extends PostState {
  final String content;

  PostContentChangedState(this.content);
}


// 게시글 제출
final class PostSubmittedState extends PostState {
  final PostModel postModel;

  PostSubmittedState(this.postModel);
}

// 오류 상태
final class PostErrorState extends PostState {
  final String message;

  PostErrorState(this.message);
}





