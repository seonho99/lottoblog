import '../../../models/post_model.dart';

sealed class PostEvent {}

final class LoadPost extends PostEvent {}

// 게시글 등록
final class CreatePost extends PostEvent {
  final PostModel posts;

  CreatePost({required this.posts});
}

// 게시글 수정
final class UpdatePost extends PostEvent {
  final String postId;
  final String title;
  final String content;
  final List<String> imageUrls;

  UpdatePost({
    required this.postId,
    required this.title,
    required this.content,
    required this.imageUrls,
  });
}

// 게시글 삭제
final class DeletePost extends PostEvent {
  final String postId;

  DeletePost({required this.postId});
}

final class ReadPost extends PostEvent {
  final String postId;

  ReadPost({required this.postId});
}

final class FetchAllPosts extends PostEvent {
  final String uid;

  FetchAllPosts({required this.uid});
}

