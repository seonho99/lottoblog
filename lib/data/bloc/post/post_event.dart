import '../../../models/post_model.dart';

sealed class PostEvent {
  const PostEvent();
}

// 게시글 수정
final class PostContentChangedEvent extends PostEvent {
  final String title;
  final String content;
  final List<String> imageUrls;

  PostContentChangedEvent(
       this.title,
       this.content,
       this.imageUrls,);
}

// 게시글 제출 중
final class PostSubmittedEvent extends PostEvent {
  final PostModel postModel;

  PostSubmittedEvent(this.postModel);
}
