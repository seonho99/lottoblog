import '../../../models/post_model.dart';

sealed class PostEvent {
  const PostEvent();
}

// 게시글 수정
final class PostContentChangedEvent extends PostEvent {
  final String title;
  final String content;
  final String uid;
  final List<String> imageUrls;

  PostContentChangedEvent(
      this.title,
      this.content,
      this.uid,
      this.imageUrls,
      );
}

// 게시글
final class PostSubmittedEvent extends PostEvent {
  final PostModel postModel;

  PostSubmittedEvent(this.postModel);
}

// 게시글 수정
final class PostUpdateEvent extends PostEvent {
  final PostModel postModel;

  PostUpdateEvent(this.postModel);
}

final class PostGetAllPostsEvent extends PostEvent {
  final String uid;
  PostGetAllPostsEvent(this.uid);
}