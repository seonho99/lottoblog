
import '../../../models/post_model.dart';

sealed class PostState {
  final List<PostModel> posts;

  PostState({required this.posts});
}

// 초기 상태
final class PostInitial extends PostState {
  PostInitial() : super(posts: []);
}

// 로딩 상태
final class PostLoading extends PostState {
  PostLoading() : super(posts: []);
}

// 게시글 갱신 상태
final class PostLoaded extends PostState {
  PostLoaded(List<PostModel> posts) : super(posts: posts);
}

final class PostFailure extends PostState {
  final String errorMessage;

  PostFailure({required this.errorMessage}) : super(posts: []);
}
