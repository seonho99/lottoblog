import '../../../models/post_model.dart';

sealed class PostEvent {}

// 게시글 등록
final class CreatePost extends PostEvent {
  PostModel posts;

  CreatePost({required this.posts});
}

final class UpdatePostEvent extends PostEvent {
  String postId;

  UpdatePostEvent({required this.postId});
}

