import '../../../models/post_model.dart';

sealed class PostState {}

// 초기 상태
final class PostInitialState extends PostState {}

// 게시글 변경
final class PostContentChangedState extends PostState {
  final String title;
  final String content;
  final List<String>? imageUrls;

  PostContentChangedState({
    required this.title,
    required this.content,
    this.imageUrls,
  });
}

// 게시글 제출
final class PostSubmittedState extends PostState {
  final PostModel postModel;

  PostSubmittedState(this.postModel);
}

// 게시글 수정
final class PostUpdatedState extends PostState {
  final PostModel postModel;

  PostUpdatedState(this.postModel);
}

final class PostLoadingState extends PostState {}

final class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

// 오류 상태
final class PostErrorState extends PostState {
  final String message;

  PostErrorState(this.message);
}
