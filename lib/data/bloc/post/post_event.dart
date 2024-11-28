import 'package:lottoblog/models/post_model.dart';

sealed class PostEvent {
  const PostEvent();
}

// 게시글 수정
final class PostContentChangedEvent extends PostEvent {
  final String content;

  PostContentChangedEvent(this.content);
}

// 게시글 제출 중
final class PostSubmittedEvent extends PostEvent {
  final PostModel postModel;

  PostSubmittedEvent(this.postModel);
}
