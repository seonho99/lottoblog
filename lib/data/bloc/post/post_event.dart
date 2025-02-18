import '../../../models/post_model.dart';

sealed class PostEvent {}

// 게시글 등록
final class CreatePost extends PostEvent {
  final PostModel posts;

  CreatePost({required this.posts});
}



