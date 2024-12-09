import '../../../models/post_model.dart';

sealed class PostEvent {
  const PostEvent();
}

final class LoadPost extends PostEvent {}

// 게시글 등록
final class AddPost extends PostEvent {
  final PostModel postModel;

  AddPost(this.postModel);
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

final class readPost extends PostEvent {
  final String postId;

  readPost({required this.postId});
}


